import { CommonModule } from '@angular/common';
import { Component, input, output } from '@angular/core';
import { ButtonModule } from 'primeng/button';
import { TranslatePipe } from '../../core/i18n/translate.pipe';

@Component({
  selector: 'app-upload-panel',
  standalone: true,
  imports: [CommonModule, ButtonModule, TranslatePipe],
  templateUrl: './upload-panel.component.html',
  styleUrls: ['./upload-panel.component.css']
})
export class UploadPanelComponent {
  readonly inputId = input.required<string>();
  readonly label = input('shared.upload.selectFile');
  readonly accept = input('');
  readonly fileName = input('');
  readonly emptyFileText = input('shared.upload.noFileSelected');
  readonly hint = input('');
  readonly hintSeverity = input<'muted' | 'info' | 'warn' | 'success'>('muted');
  readonly buttonLabel = input('shared.upload.uploadFile');
  readonly buttonIcon = input('pi pi-upload');
  readonly loading = input(false);
  readonly uploadDisabled = input(false);
  readonly multiple = input(false);

  readonly fileSelected = output<File | null>();
  readonly uploadTriggered = output<void>();

  onFileChange(event: Event): void {
    const input = event.target as HTMLInputElement;
    const file = input.files?.[0] || null;
    this.fileSelected.emit(file);
  }

  onUpload(): void {
    this.uploadTriggered.emit();
  }
}
