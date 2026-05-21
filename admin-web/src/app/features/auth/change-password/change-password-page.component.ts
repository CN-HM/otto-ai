import { CommonModule } from '@angular/common';
import { Component, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { finalize } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { PasswordModule } from 'primeng/password';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { ApiResponse } from '../../../core/models/api.models';
import { AuthService } from '../../../core/auth/auth.service';
import { ChangePasswordRequest } from '../../../core/auth/auth.models';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';

@Component({
  selector: 'app-change-password-page',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    ButtonModule,
    CardModule,
    PasswordModule,
    FeedbackMessageComponent,
    TranslatePipe
  ],
  templateUrl: './change-password-page.component.html',
  styleUrl: './change-password-page.component.css'
})
export class ChangePasswordPageComponent {
  private readonly formBuilder = inject(FormBuilder);
  private readonly authService = inject(AuthService);
  private readonly router = inject(Router);

  readonly submitting = signal(false);
  readonly errorMessage = signal('');
  readonly successMessage = signal('');

  readonly form = this.formBuilder.nonNullable.group({
    password: ['', [Validators.required]],
    newPassword: ['', [Validators.required]],
    confirmPassword: ['', [Validators.required]]
  });

  submit(): void {
    if (this.form.invalid || this.submitting()) {
      this.form.markAllAsTouched();
      return;
    }

    const { password, newPassword, confirmPassword } = this.form.getRawValue();
    if (newPassword !== confirmPassword) {
      this.errorMessage.set('auth.changePasswordMismatch');
      return;
    }

    this.errorMessage.set('');
    this.successMessage.set('');
    this.submitting.set(true);

    const payload: ChangePasswordRequest = {
      password,
      newPassword
    };

    this.authService
      .changePassword(payload)
      .pipe(finalize(() => this.submitting.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          if (response.code !== 0) {
            this.errorMessage.set(response.msg || 'auth.changePasswordFailed');
            return;
          }

          this.successMessage.set('auth.changePasswordSuccess');
          this.authService.logout();
          setTimeout(() => {
            void this.router.navigate(['/login']);
          }, 800);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.errorMessage.set(error.error?.msg || error.message || 'auth.changePasswordRequestFailed');
        }
      });
  }

  get passwordInvalid(): boolean {
    const control = this.form.controls.password;
    return control.invalid && (control.dirty || control.touched);
  }

  get newPasswordInvalid(): boolean {
    const control = this.form.controls.newPassword;
    return control.invalid && (control.dirty || control.touched);
  }

  get confirmPasswordInvalid(): boolean {
    const control = this.form.controls.confirmPassword;
    return control.invalid && (control.dirty || control.touched);
  }
}
