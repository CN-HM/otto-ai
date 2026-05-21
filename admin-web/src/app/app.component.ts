import { Component, inject, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { I18nService } from './core/i18n/i18n.service';
import { DomI18nDirective } from './core/i18n/dom-i18n.directive';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, DomI18nDirective],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  private i18nService = inject(I18nService);

  ngOnInit(): void {
    this.i18nService.init();
  }
}
