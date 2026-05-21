import { Injectable, inject } from '@angular/core';
import { I18nService } from '../../core/i18n/i18n.service';

interface ConfirmActionOptions {
  header?: string;
  message: string;
  acceptLabel?: string;
  rejectLabel?: string;
  accept: () => void;
  reject?: () => void;
}

@Injectable({
  providedIn: 'root'
})
export class ConfirmDialogService {
  private readonly i18n = inject(I18nService);

  confirmDanger(options: ConfirmActionOptions): void {
    const header = options.header || this.i18n.translate('shared.confirm.title');
    const confirmed = window.confirm(`${header}\n\n${options.message}`);
    if (confirmed) {
      options.accept();
      return;
    }

    options.reject?.();
  }
}
