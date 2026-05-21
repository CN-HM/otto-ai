import { CommonModule } from '@angular/common';
import { Component, OnInit, ViewChild, inject, signal } from '@angular/core';
import { DomSanitizer, SafeUrl } from '@angular/platform-browser';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { PasswordModule } from 'primeng/password';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { ApiResponse } from '../../../core/models/api.models';
import { AuthService } from '../../../core/auth/auth.service';
import { ADMIN_APP_MANIFEST, AdminBranding } from '../../../core/microfrontends/admin-app.manifest';
import { RetrievePasswordRequest, SmsVerificationRequest } from '../../../core/auth/auth.models';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { TurnstileComponent } from '../../../shared/components/turnstile.component';

@Component({
  selector: 'app-retrieve-password-page',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    ButtonModule,
    CardModule,
    InputTextModule,
    PasswordModule,
    FeedbackMessageComponent,
    TranslatePipe,
    TurnstileComponent
  ],
  templateUrl: './retrieve-password-page.component.html',
  styleUrl: './retrieve-password-page.component.css'
})
export class RetrievePasswordPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly sanitizer = inject(DomSanitizer);
  private readonly authService = inject(AuthService);
  private readonly router = inject(Router);
  private readonly manifest = inject(ADMIN_APP_MANIFEST);

  readonly submitting = signal(false);
  readonly sendingCode = signal(false);
  readonly errorMessage = signal('');
  readonly successMessage = signal('');
  readonly smsMessage = signal('');
  readonly captchaUrl = signal<SafeUrl | null>(null);

  get branding(): AdminBranding {
    return this.manifest.branding;
  }

  @ViewChild(TurnstileComponent) turnstile!: TurnstileComponent;

  readonly form = this.formBuilder.nonNullable.group({
    phone: ['', [Validators.required]],
    code: ['', [Validators.required]],
    password: ['', [Validators.required]],
    captchaId: [this.generateUUID()],
    captcha: ['', [Validators.required]]
  });

  ngOnInit(): void {
    this.refreshCaptcha();
  }

  refreshCaptcha(): void {
    const uuid = this.generateUUID();
    this.form.patchValue({ captchaId: uuid });

    this.authService.getCaptcha(uuid).subscribe({
      next: (blob: Blob) => {
        const url = URL.createObjectURL(blob);
        this.captchaUrl.set(this.sanitizer.bypassSecurityTrustUrl(url));
      },
      error: () => {
        this.captchaUrl.set(null);
      }
    });
  }

  private generateUUID(): string {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, c => {
      const r = (Math.random() * 16) | 0;
      return (c === 'x' ? r : (r & 0x3) | 0x8).toString(16);
    });
  }

  submit(): void {
    if (this.form.invalid || this.submitting()) {
      this.form.markAllAsTouched();
      return;
    }

    // Check Turnstile only if enabled
    const turnstileToken = this.turnstile?.getToken();
    if (this.turnstile?.enabled() && !turnstileToken) {
      this.errorMessage.set('auth.turnstileRequired');
      return;
    }

    this.errorMessage.set('');
    this.successMessage.set('');
    this.submitting.set(true);

    const { phone, code, password, captchaId } = this.form.getRawValue();
    const payload: RetrievePasswordRequest = {
      phone,
      code,
      password,
      captchaId,
      turnstileToken: turnstileToken ?? undefined
    };

    this.authService
      .retrievePassword(payload)
      .pipe(finalize(() => this.submitting.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          if (response.code !== 0) {
            this.errorMessage.set(response.msg || 'auth.retrievePasswordFailed');
            return;
          }

          this.successMessage.set('auth.retrievePasswordSuccess');
          setTimeout(() => {
            void this.router.navigate(['/login']);
          }, 800);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.errorMessage.set(error.error?.msg || error.message || 'auth.retrievePasswordRequestFailed');
        }
      });
  }

  sendSmsCode(): void {
    if (this.sendingCode()) {
      return;
    }

    const { phone, captcha, captchaId } = this.form.getRawValue();
    if (!phone || !captcha || !captchaId) {
      this.form.controls.phone.markAsTouched();
      this.form.controls.captcha.markAsTouched();
      this.form.controls.captchaId.markAsTouched();
      this.smsMessage.set('auth.retrievePasswordFillCaptchaFirst');
      return;
    }

    this.smsMessage.set('');
    this.sendingCode.set(true);

    const payload: SmsVerificationRequest = {
      phone,
      captcha,
      captchaId
    };

    this.authService
      .smsVerification(payload)
      .pipe(finalize(() => this.sendingCode.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          this.smsMessage.set(response.code === 0 ? 'auth.smsSent' : response.msg || 'auth.smsSendFailed');
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.smsMessage.set(error.error?.msg || error.message || 'auth.smsSendFailed');
        }
      });
  }

  get phoneInvalid(): boolean {
    const control = this.form.controls.phone;
    return control.invalid && (control.dirty || control.touched);
  }

  get codeInvalid(): boolean {
    const control = this.form.controls.code;
    return control.invalid && (control.dirty || control.touched);
  }

  get passwordInvalid(): boolean {
    const control = this.form.controls.password;
    return control.invalid && (control.dirty || control.touched);
  }

  get captchaInvalid(): boolean {
    const control = this.form.controls.captcha;
    return control.invalid && (control.dirty || control.touched);
  }
}
