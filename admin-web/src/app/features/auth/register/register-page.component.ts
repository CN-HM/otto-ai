import { CommonModule } from '@angular/common';
import { Component, OnInit, ViewChild, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { ApiResponse } from '../../../core/models/api.models';
import { AuthService } from '../../../core/auth/auth.service';
import { PubConfigService } from '../../../core/config/pub-config.service';
import { ADMIN_APP_MANIFEST, AdminBranding } from '../../../core/microfrontends/admin-app.manifest';
import { RegisterRequest, SmsVerificationRequest } from '../../../core/auth/auth.models';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { TurnstileComponent } from '../../../shared/components/turnstile.component';

@Component({
  selector: 'app-register-page',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    ButtonModule,
    CardModule,
    InputTextModule,
    FeedbackMessageComponent,
    TranslatePipe,
    TurnstileComponent
  ],
  templateUrl: './register-page.component.html',
  styleUrl: './register-page.component.css'
})
export class RegisterPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly authService = inject(AuthService);
  private readonly router = inject(Router);
  private readonly pubConfigService = inject(PubConfigService);
  private readonly manifest = inject(ADMIN_APP_MANIFEST);

  readonly submitting = signal(false);
  readonly sendingCode = signal(false);
  readonly errorMessage = signal('');
  readonly successMessage = signal('');
  readonly smsMessage = signal('');
  readonly config = this.pubConfigService.config;

  get branding(): AdminBranding {
    return this.manifest.branding;
  }

  @ViewChild(TurnstileComponent) turnstile!: TurnstileComponent;

  readonly form = this.formBuilder.nonNullable.group({
    phone: ['', [Validators.required]],
    mobileCaptcha: ['', [Validators.required]]
  });

  ngOnInit(): void {
    this.pubConfigService.fetchConfig();
  }

  submit(): void {
    if (this.config()?.allowUserRegister === false) {
      this.errorMessage.set('auth.registerClosed');
      return;
    }

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

    const { phone, mobileCaptcha } = this.form.getRawValue();
    const payload: RegisterRequest = {
      phone,
      code: mobileCaptcha,
      turnstileToken: turnstileToken ?? undefined
    };

    this.authService
      .register(payload)
      .pipe(finalize(() => this.submitting.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          if (response.code !== 0) {
            this.errorMessage.set(response.msg || 'auth.registerFailed');
            return;
          }

          this.successMessage.set('auth.registerSuccess');
          setTimeout(() => {
            void this.router.navigate(['/login']);
          }, 800);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.errorMessage.set(error.error?.msg || error.message || 'auth.registerRequestFailed');
        }
      });
  }

  sendSmsCode(): void {
    if (this.config()?.allowUserRegister === false) {
      this.smsMessage.set('auth.registerClosed');
      return;
    }

    if (this.sendingCode()) {
      return;
    }

    const { phone } = this.form.getRawValue();
    if (!phone) {
      this.form.controls.phone.markAsTouched();
      this.smsMessage.set('auth.registerEnterPhoneFirst');
      return;
    }

    this.smsMessage.set('');
    this.sendingCode.set(true);

    const payload: SmsVerificationRequest = {
      phone,
      captcha: '',
      captchaId: ''
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

  get mobileCaptchaInvalid(): boolean {
    const control = this.form.controls.mobileCaptcha;
    return control.invalid && (control.dirty || control.touched);
  }
}
