import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { ButtonModule } from 'primeng/button';
import { TranslatePipe } from '../../core/i18n/translate.pipe';

@Component({
  selector: 'app-forbidden-page',
  standalone: true,
  imports: [RouterLink, ButtonModule, TranslatePipe],
  template: `
    <section class="forbidden-page">
      <div class="forbidden-content">
        <i class="pi pi-lock" style="font-size: 4rem; color: var(--p-red-500);"></i>
        <h1>403</h1>
        <h2>{{ 'errors.noPermissionTitle' | translate }}</h2>
        <p>{{ 'errors.noPermissionDescription' | translate }}</p>
        <a
          pButton
          routerLink="/dashboard"
          [label]="'errors.backToDashboard' | translate"
          icon="pi pi-home"
          severity="contrast"
        ></a>
      </div>
    </section>
  `,
  styles: [
    `
      .forbidden-page {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 80vh;
      }
      .forbidden-content {
        text-align: center;
        max-width: 400px;
      }
      .forbidden-content h1 {
        font-size: 5rem;
        font-weight: 800;
        margin: 1rem 0 0;
        color: var(--p-red-500);
      }
      .forbidden-content h2 {
        margin: 0.5rem 0;
        color: var(--p-surface-700);
      }
      .forbidden-content p {
        color: var(--p-surface-500);
        margin-bottom: 2rem;
      }
    `
  ]
})
export class ForbiddenPageComponent {}
