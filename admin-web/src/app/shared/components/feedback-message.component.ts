import { CommonModule } from '@angular/common';
import { Component, input } from '@angular/core';
import { MessageModule } from 'primeng/message';

@Component({
  selector: 'app-feedback-message',
  standalone: true,
  imports: [CommonModule, MessageModule],
  templateUrl: './feedback-message.component.html',
  styleUrl: './feedback-message.component.css'
})
export class FeedbackMessageComponent {
  readonly text = input('');
  readonly severity = input<'success' | 'info' | 'warn' | 'error' | 'secondary' | 'contrast'>('info');
}
