import { CommonModule, DatePipe } from '@angular/common';
import { Component, OnInit, computed, inject } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { Params, RouterLink } from '@angular/router';
import { firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { ApiResponse } from '../../../core/models/api.models';
import { I18nService } from '../../../core/i18n/i18n.service';
import { EmptyStateComponent } from '../../../shared/components/empty-state.component';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { SearchFilterCardComponent } from '../../../shared/components/search-filter-card.component';
import {
  SummaryMetricGridComponent,
  SummaryMetricItem
} from '../../../shared/components/summary-metric-grid.component';
import { PageableListStore } from '../../../shared/stores/pageable-list.store';
import { DeviceListItem } from './device.models';
import { DeviceService } from './device.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';

@Component({
  selector: 'app-devices-page',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    DatePipe,
    ButtonModule,
    CardModule,
    InputTextModule,
    TableModule,
    TagModule,
    EmptyStateComponent,
    FeedbackMessageComponent,
    PageToolbarComponent,
    SearchFilterCardComponent,
    SummaryMetricGridComponent,
    TranslatePipe
  ],
  templateUrl: './devices-page.component.html',
  styleUrl: './devices-page.component.css'
})
export class DevicesPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly deviceService = inject(DeviceService);
  private readonly i18n = inject(I18nService);
  private readonly store = new PageableListStore<DeviceListItem>(async (page, limit) => {
    const res = await firstValueFrom(
      this.deviceService.getDevicePage({
        keywords: this.searchForm.getRawValue().keywords || undefined,
        page,
        limit
      })
    );
    if (res.code !== 0) throw new Error(res.msg || this.i18n.translate('devices.loadFailed'));
    return res.data ?? { total: 0, list: [] };
  });

  readonly loading = this.store.loading;
  readonly errorMessage = this.store.errorMessage;
  readonly devices = this.store.items;
  readonly total = this.store.total;
  expandedRows: Record<string, boolean> = {};

  readonly searchForm = this.formBuilder.nonNullable.group({
    keywords: ['']
  });

  readonly otaEnabledCount = computed(
    () => this.devices().filter((item: DeviceListItem) => item.otaUpgrade === 1).length
  );
  readonly boundUserCount = computed(() => this.devices().filter((item: DeviceListItem) => !!item.bindUserName).length);
  readonly metricItems = computed<SummaryMetricItem[]>(() => {
    this.i18n.localeVersion();
    return [
      { title: this.i18n.translate('devices.totalCount'), value: this.total() },
      { title: this.i18n.translate('devices.currentPageBoundUsers'), value: this.boundUserCount() },
      { title: this.i18n.translate('devices.currentPageOtaEnabled'), value: this.otaEnabledCount() }
    ];
  });

  ngOnInit(): void {
    this.loadDevices();
  }

  loadDevices(page = this.store.page): void {
    this.store.page = page;
    void this.store.load();
  }

  search(): void {
    this.loadDevices(1);
  }

  reset(): void {
    this.searchForm.reset({ keywords: '' });
    this.loadDevices(1);
  }

  unbind(device: DeviceListItem): void {
    this.errorMessage.set('');
    this.deviceService.deleteDevice(device.id).subscribe({
      next: (response: ApiResponse<unknown>) => {
        if (response.code !== 0) {
          this.errorMessage.set(response.msg || this.i18n.translate('devices.unbindFailed'));
          return;
        }

        this.loadDevices(this.store.page);
      },
      error: (error: { error?: { msg?: string }; message?: string }) => {
        this.errorMessage.set(error.error?.msg || error.message || this.i18n.translate('devices.unbindRequestFailed'));
      }
    });
  }

  manualAdd(device: DeviceListItem): void {
    this.errorMessage.set('');
    this.deviceService
      .manualAdd({
        macAddress: device.macAddress,
        appVersion: device.appVersion,
        board: device.deviceType
      })
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          this.errorMessage.set(response.code === 0 ? this.i18n.translate('devices.manualAddTriggered') : response.msg || this.i18n.translate('devices.manualAddFailed'));
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.errorMessage.set(error.error?.msg || error.message || this.i18n.translate('devices.manualAddRequestFailed'));
        }
      });
  }

  detailQueryParams(device: DeviceListItem): Params {
    return {
      macAddress: device.macAddress,
      bindUserName: device.bindUserName,
      deviceType: device.deviceType,
      appVersion: device.appVersion,
      otaUpgrade: device.otaUpgrade,
      recentChatTime: device.recentChatTime
    };
  }

  otaLabel(value?: number): string {
    return value === 1 ? this.i18n.translate('devices.otaEnabled') : this.i18n.translate('devices.otaDisabled');
  }

  otaSeverity(value?: number): 'success' | 'secondary' {
    return value === 1 ? 'success' : 'secondary';
  }
}
