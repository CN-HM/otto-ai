import { CommonModule } from '@angular/common';
import { Component, input } from '@angular/core';
import { CardModule } from 'primeng/card';

@Component({
  selector: 'app-page-toolbar',
  standalone: true,
  imports: [CommonModule, CardModule],
  template: `
    <p-card styleClass="page-toolbar-card">
      <div class="page-toolbar">
        <div class="page-toolbar-content">
          @if (title()) {
            <div class="page-toolbar-title">{{ title() }}</div>
          }
          @if (description()) {
            <div class="page-toolbar-description">{{ description() }}</div>
          }
        </div>
        <div class="page-toolbar-actions">
          <ng-content></ng-content>
        </div>
      </div>
    </p-card>
  `,
  styles: [
    `
      :host {
        display: block;
      }

      :host ::ng-deep .page-toolbar-card .p-card-body {
        padding: 0.85rem 1rem;
      }

      :host ::ng-deep .page-toolbar-card .p-card-content {
        padding: 0;
      }

      .page-toolbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 1rem;
      }

      .page-toolbar-content {
        min-width: 0;
        display: flex;
        flex-direction: column;
        gap: 0.2rem;
      }

      .page-toolbar-title {
        color: var(--text-color);
        font-weight: 700;
      }

      .page-toolbar-description {
        color: var(--text-color-muted);
        font-size: 0.86rem;
      }

      .page-toolbar-actions {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        flex-wrap: wrap;
        gap: 0.75rem;
      }

      :host ::ng-deep .page-toolbar-actions .p-button {
        min-height: 2.75rem;
        align-items: center;
        padding: 0.5rem 1rem;
        font-size: 0.95rem;
        text-decoration: none;
      }

      :host ::ng-deep .page-toolbar-actions .p-button.p-button-icon-only {
        padding: 0.5rem;
        text-decoration: none;
      }

      @media (max-width: 768px) {
        .page-toolbar {
          align-items: stretch;
          flex-direction: column;
        }

        .page-toolbar-actions {
          justify-content: flex-start;
        }
      }
    `
  ]
})
export class PageToolbarComponent {
  readonly title = input('');
  readonly description = input('');
}
