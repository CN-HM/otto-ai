import { CommonModule } from '@angular/common';
import { Component, input } from '@angular/core';
import { CardModule } from 'primeng/card';
import { TranslatePipe } from '../../core/i18n/translate.pipe';

@Component({
  selector: 'app-form-detail-layout',
  standalone: true,
  imports: [CommonModule, CardModule, TranslatePipe],
  templateUrl: './form-detail-layout.component.html',
  styleUrl: './form-detail-layout.component.css'
})
export class FormDetailLayoutComponent {
  readonly formTitle = input('shared.layout.formConfig');
  readonly asideTitle = input('shared.layout.fillGuide');
}
