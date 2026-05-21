import { CommonModule } from '@angular/common';
import { Component, computed, input, output } from '@angular/core';
import { ButtonModule } from 'primeng/button';
import { TranslatePipe } from '../../core/i18n/translate.pipe';

@Component({
  selector: 'app-pagination-bar',
  standalone: true,
  imports: [CommonModule, ButtonModule, TranslatePipe],
  templateUrl: './pagination-bar.component.html',
  styleUrl: './pagination-bar.component.css'
})
export class PaginationBarComponent {
  readonly total = input(0);
  readonly page = input(1);
  readonly limit = input(10);
  readonly loading = input(false);
  readonly pageSizeOptions = input<number[]>([10, 20, 50, 100]);

  readonly pageChange = output<number>();
  readonly limitChange = output<number>();

  readonly totalPages = computed(() => {
    const size = Math.max(1, this.limit() || 1);
    const count = Math.ceil((this.total() || 0) / size);
    return Math.max(1, count);
  });

  readonly startIndex = computed(() => {
    if (this.total() <= 0) {
      return 0;
    }

    return (this.page() - 1) * this.limit() + 1;
  });

  readonly endIndex = computed(() => {
    if (this.total() <= 0) {
      return 0;
    }

    return Math.min(this.page() * this.limit(), this.total());
  });

  readonly canGoPrevious = computed(() => !this.loading() && this.page() > 1);
  readonly canGoNext = computed(() => !this.loading() && this.page() < this.totalPages());

  goPrevious(): void {
    if (!this.canGoPrevious()) {
      return;
    }

    this.pageChange.emit(this.page() - 1);
  }

  goNext(): void {
    if (!this.canGoNext()) {
      return;
    }

    this.pageChange.emit(this.page() + 1);
  }

  onLimitSelect(value: string): void {
    const nextLimit = Number(value);
    if (!Number.isFinite(nextLimit) || nextLimit <= 0 || nextLimit === this.limit()) {
      return;
    }

    this.limitChange.emit(nextLimit);
  }
}
