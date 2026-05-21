import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { CardModule } from 'primeng/card';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';

@Component({
  selector: 'app-device-bind-page',
  standalone: true,
  imports: [CommonModule, CardModule, FeedbackMessageComponent],
  templateUrl: './device-bind-page.component.html',
  styleUrl: './device-bind-page.component.css'
})
export class DeviceBindPageComponent {}
