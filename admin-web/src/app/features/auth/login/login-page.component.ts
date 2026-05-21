import { CommonModule } from '@angular/common';
import { Component, OnInit, ViewChild, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { PasswordModule } from 'primeng/password';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { ApiResponse } from '../../../core/models/api.models';
import { TokenPayload } from '../../../core/auth/auth.models';
import { PubConfigService } from '../../../core/config/pub-config.service';
import { ADMIN_APP_MANIFEST, AdminBranding } from '../../../core/microfrontends/admin-app.manifest';
import { AuthService } from '../../../core/auth/auth.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { TurnstileComponent } from '../../../shared/components/turnstile.component';

@Component({
  selector: 'app-login-page',
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
  templateUrl: './login-page.component.html',
  styleUrl: './login-page.component.css'
})
export class LoginPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly authService = inject(AuthService);
  private readonly router = inject(Router);
  private readonly route = inject(ActivatedRoute);
  private readonly pubConfigService = inject(PubConfigService);
  private readonly manifest = inject(ADMIN_APP_MANIFEST);

  readonly submitting = signal(false);
  readonly errorMessage = signal('');
  readonly config = this.pubConfigService.config;

  get branding(): AdminBranding {
    return this.manifest.branding;
  }

  @ViewChild(TurnstileComponent) turnstile!: TurnstileComponent;

  readonly form = this.formBuilder.nonNullable.group({
    username: ['', [Validators.required]],
    password: ['', [Validators.required]]
  });

  constructor() {
    if (this.authService.isAuthenticated()) {
      void this.router.navigate(['/dashboard']);
    }
  }

  ngOnInit(): void {
    this.pubConfigService.fetchConfig();
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

    const { username, password } = this.form.getRawValue();

    this.errorMessage.set('');
    this.submitting.set(true);

    this.authService
      .login({ username, password, turnstileToken: turnstileToken ?? undefined })
      .pipe(finalize(() => this.submitting.set(false)))
      .subscribe({
        next: (response: ApiResponse<TokenPayload>) => {
          if (response.code !== 0 || !response.data?.token) {
            this.errorMessage.set(response.msg || 'auth.loginFailed');
            return;
          }

          const redirect = this.route.snapshot.queryParamMap.get('redirect') || '/dashboard';
          void this.router.navigateByUrl(redirect);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.errorMessage.set(error.error?.msg || error.message || 'auth.loginRequestFailed');
        }
      });
  }

  get usernameInvalid(): boolean {
    const control = this.form.controls.username;
    return control.invalid && (control.dirty || control.touched);
  }

  get passwordInvalid(): boolean {
    const control = this.form.controls.password;
    return control.invalid && (control.dirty || control.touched);
  }
}
