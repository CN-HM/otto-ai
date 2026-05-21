import { CommonModule } from '@angular/common';
import { Component, input } from '@angular/core';
import { CardModule } from 'primeng/card';
import { TagModule } from 'primeng/tag';
import { TranslatePipe } from '../../core/i18n/translate.pipe';

export type SummaryMetricSeverity = 'success' | 'info' | 'warn' | 'danger' | 'secondary' | 'contrast';

export interface SummaryMetricItem {
  title: string;
  value: string | number;
  description?: string;
  severity?: SummaryMetricSeverity;
}

@Component({
  selector: 'app-summary-metric-grid',
  standalone: true,
  imports: [CommonModule, CardModule, TagModule, TranslatePipe],
  templateUrl: './summary-metric-grid.component.html',
  styleUrl: './summary-metric-grid.component.css'
})
export class SummaryMetricGridComponent {
  readonly items = input.required<SummaryMetricItem[]>();
  readonly columns = input(3);
}
