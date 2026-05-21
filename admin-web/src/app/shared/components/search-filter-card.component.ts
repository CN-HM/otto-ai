import { CommonModule } from '@angular/common';
import { Component, input, output } from '@angular/core';
import { FormGroup, ReactiveFormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { TranslatePipe } from '../../core/i18n/translate.pipe';

@Component({
  selector: 'app-search-filter-card',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, ButtonModule, CardModule, TranslatePipe],
  templateUrl: './search-filter-card.component.html',
  styleUrls: ['./search-filter-card.component.css']
})
export class SearchFilterCardComponent {
  readonly title = input('shared.filters.title');
  readonly formGroup = input.required<FormGroup>();
  readonly loading = input(false);
  readonly columns = input(4);
  readonly submitLabel = input('shared.filters.search');
  readonly resetLabel = input('common.reset');
  readonly submitIcon = input('pi pi-search');
  readonly resetIcon = input('pi pi-refresh');

  readonly submitted = output<void>();
  readonly resetTriggered = output<void>();

  onSubmit(): void {
    this.submitted.emit();
  }

  onReset(): void {
    this.resetTriggered.emit();
  }
}
