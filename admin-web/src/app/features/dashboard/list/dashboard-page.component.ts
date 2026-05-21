import { CommonModule } from '@angular/common';
import { Component, DestroyRef, OnInit, computed, inject, signal } from '@angular/core';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { RouterLink } from '@angular/router';
import { finalize, skip } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { TagModule } from 'primeng/tag';
import {
  DashboardPanel,
  DashboardRuntimeOverview,
  DashboardRuntimeRecentTurn,
  DashboardRuntimeService,
  DashboardRuntimeStageAggregate,
  DashboardSnapshot,
  DashboardMetric,
  DashboardSeverity,
  DashboardSectionKey
} from './dashboard.models';
import { PermissionService } from '../../../core/auth/permission.service';
import { ADMIN_APP_MANIFEST, AdminBranding } from '../../../core/microfrontends/admin-app.manifest';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { DashboardService } from './dashboard.service';
import {
  DASHBOARD_METRIC_PRIORITY,
  DASHBOARD_PANEL_PRIORITY,
  DASHBOARD_SECTION_LAYOUTS,
  DashboardLayoutKey
} from './dashboard-composition.constants';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import {
  SummaryMetricGridComponent,
  SummaryMetricItem
} from '../../../shared/components/summary-metric-grid.component';

const EMPTY_RUNTIME_OVERVIEW: DashboardRuntimeOverview = {
  nodeId: '-',
  runtimeEnabled: false,
  nodeStartedAtUtc: '',
  onlineDeviceCount: 0,
  activeConversationCount: 0,
  aliveConversationCount: 0,
  udpSessionCount: 0,
  localSpeechIdleTimeoutMs: 0,
  services: [],
  conversationTrace: {
    totalStageCount: 0,
    successfulStageCount: 0,
    failedStageCount: 0,
    fallbackStageCount: 0,
    stageAggregates: [],
    recentTurns: []
  },
  readiness: {
    ready: false,
    severity: 'secondary',
    passedCheckCount: 0,
    warningCheckCount: 0,
    failedCheckCount: 0,
    checks: []
  }
};

interface DashboardSectionHeading {
  title: string;
  description: string;
}

interface DashboardLayoutCopy {
  heroFocus: string;
  metrics: DashboardSectionHeading;
  runtimeOverview: DashboardSectionHeading;
  quickActions: DashboardSectionHeading;
  runtimeServices: DashboardSectionHeading;
  panels: DashboardSectionHeading;
  secondaryMetricsTitle: string;
}

const DASHBOARD_LAYOUT_COPY: Record<string, DashboardLayoutCopy> = {
  baseline: {
    heroFocus: 'dashboard.layout.baseline.heroFocus',
    metrics: {
      title: 'dashboard.layout.baseline.metrics.title',
      description: 'dashboard.layout.baseline.metrics.description'
    },
    runtimeOverview: {
      title: 'dashboard.layout.baseline.runtimeOverview.title',
      description: 'dashboard.layout.baseline.runtimeOverview.description'
    },
    quickActions: {
      title: 'dashboard.layout.baseline.quickActions.title',
      description: 'dashboard.layout.baseline.quickActions.description'
    },
    runtimeServices: {
      title: 'dashboard.layout.baseline.runtimeServices.title',
      description: 'dashboard.layout.baseline.runtimeServices.description'
    },
    panels: {
      title: 'dashboard.layout.baseline.panels.title',
      description: 'dashboard.layout.baseline.panels.description'
    },
    secondaryMetricsTitle: 'dashboard.layout.baseline.secondaryMetricsTitle'
  },
  companion: {
    heroFocus: 'dashboard.layout.companion.heroFocus',
    metrics: {
      title: 'dashboard.layout.companion.metrics.title',
      description: 'dashboard.layout.companion.metrics.description'
    },
    runtimeOverview: {
      title: 'dashboard.layout.companion.runtimeOverview.title',
      description: 'dashboard.layout.companion.runtimeOverview.description'
    },
    quickActions: {
      title: 'dashboard.layout.companion.quickActions.title',
      description: 'dashboard.layout.companion.quickActions.description'
    },
    runtimeServices: {
      title: 'dashboard.layout.companion.runtimeServices.title',
      description: 'dashboard.layout.companion.runtimeServices.description'
    },
    panels: {
      title: 'dashboard.layout.companion.panels.title',
      description: 'dashboard.layout.companion.panels.description'
    },
    secondaryMetricsTitle: 'dashboard.layout.companion.secondaryMetricsTitle'
  },
  persona: {
    heroFocus: 'dashboard.layout.persona.heroFocus',
    metrics: {
      title: 'dashboard.layout.persona.metrics.title',
      description: 'dashboard.layout.persona.metrics.description'
    },
    runtimeOverview: {
      title: 'dashboard.layout.persona.runtimeOverview.title',
      description: 'dashboard.layout.persona.runtimeOverview.description'
    },
    quickActions: {
      title: 'dashboard.layout.persona.quickActions.title',
      description: 'dashboard.layout.persona.quickActions.description'
    },
    runtimeServices: {
      title: 'dashboard.layout.persona.runtimeServices.title',
      description: 'dashboard.layout.persona.runtimeServices.description'
    },
    panels: {
      title: 'dashboard.layout.persona.panels.title',
      description: 'dashboard.layout.persona.panels.description'
    },
    secondaryMetricsTitle: 'dashboard.layout.persona.secondaryMetricsTitle'
  },
  expo: {
    heroFocus: 'dashboard.layout.expo.heroFocus',
    metrics: {
      title: 'dashboard.layout.expo.metrics.title',
      description: 'dashboard.layout.expo.metrics.description'
    },
    runtimeOverview: {
      title: 'dashboard.layout.expo.runtimeOverview.title',
      description: 'dashboard.layout.expo.runtimeOverview.description'
    },
    quickActions: {
      title: 'dashboard.layout.expo.quickActions.title',
      description: 'dashboard.layout.expo.quickActions.description'
    },
    runtimeServices: {
      title: 'dashboard.layout.expo.runtimeServices.title',
      description: 'dashboard.layout.expo.runtimeServices.description'
    },
    panels: {
      title: 'dashboard.layout.expo.panels.title',
      description: 'dashboard.layout.expo.panels.description'
    },
    secondaryMetricsTitle: 'dashboard.layout.expo.secondaryMetricsTitle'
  }
};

@Component({
  selector: 'app-dashboard-page',
  standalone: true,
  imports: [
    CommonModule,
    RouterLink,
    ButtonModule,
    CardModule,
    TagModule,
    TranslatePipe,
    FeedbackMessageComponent,
    SummaryMetricGridComponent
  ],
  templateUrl: './dashboard-page.component.html',
  styleUrl: './dashboard-page.component.css'
})
export class DashboardPageComponent implements OnInit {
  private readonly dashboardService = inject(DashboardService);
  private readonly destroyRef = inject(DestroyRef);
  private readonly manifest = inject(ADMIN_APP_MANIFEST);
  private readonly permissionService = inject(PermissionService);
  private readonly i18n = inject(I18nService);

  readonly loading = signal(false);
  readonly errorMessage = signal('');
  readonly metrics = signal<DashboardMetric[]>([]);
  readonly panels = signal<DashboardPanel[]>([]);
  readonly runtime = signal<DashboardRuntimeOverview>(EMPTY_RUNTIME_OVERVIEW);
  readonly runtimeServices = signal<DashboardRuntimeService[]>([]);
  readonly layoutCopy = computed(() => DASHBOARD_LAYOUT_COPY['baseline']);
  readonly heroPills = computed<string[]>(() => []);

  get branding(): AdminBranding {
    return this.manifest.branding;
  }

  readonly visibleMetrics = computed<DashboardMetric[]>(() =>
    this.orderByPriority(this.metrics(), DASHBOARD_METRIC_PRIORITY)
  );

  readonly primaryMetricItems = computed<SummaryMetricItem[]>(() =>
    this.visibleMetrics()
      .slice(0, 4)
      .map(metric => this.toSummaryMetricItem(metric))
  );

  readonly secondaryMetricItems = computed<SummaryMetricItem[]>(() =>
    this.visibleMetrics()
      .slice(4)
      .map(metric => this.toSummaryMetricItem(metric))
  );

  readonly secondaryMetricColumns = computed(() => Math.min(Math.max(this.secondaryMetricItems().length, 1), 3));

  readonly visiblePanels = computed<DashboardPanel[]>(() =>
    this.orderByPriority(this.panels(), DASHBOARD_PANEL_PRIORITY)
  );

  readonly orderedSectionKeys = computed<DashboardSectionKey[]>(() => {
    const sections: DashboardSectionKey[] = DASHBOARD_SECTION_LAYOUTS['baseline'];
    const hasMetrics = this.primaryMetricItems().length > 0;
    const hasRuntimeServices = this.runtimeServices().length > 0;
    const hasPanels = this.visiblePanels().length > 0;

    return sections.filter(section => {
      switch (section) {
        case 'metrics':
          return hasMetrics;
        case 'runtimeServices':
          return hasRuntimeServices;
        case 'panels':
          return hasPanels;
        default:
          return true;
      }
    });
  });

  readonly runtimeOverviewItems = computed<SummaryMetricItem[]>(() => {
    const runtime = this.runtime();
    return [
      {
        title: 'dashboard.runtimeOverview.onlineDevices.title',
        value: runtime.onlineDeviceCount,
        description: 'dashboard.runtimeOverview.onlineDevices.description'
      },
      {
        title: 'dashboard.runtimeOverview.activeConversations.title',
        value: runtime.aliveConversationCount,
        description: this.t('dashboard.runtimeOverview.activeConversations.description', {
          count: `${runtime.activeConversationCount}`
        })
      },
      {
        title: 'dashboard.runtimeOverview.udpSessions.title',
        value: runtime.udpSessionCount,
        description: 'dashboard.runtimeOverview.udpSessions.description'
      },
      {
        title: 'dashboard.runtimeOverview.speechIdleTimeout.title',
        value: `${runtime.localSpeechIdleTimeoutMs} ms`,
        description: 'dashboard.runtimeOverview.speechIdleTimeout.description'
      }
    ];
  });

  readonly dismissedBannerKeys = signal<Set<string>>(new Set());

  readonly readinessBanners = computed(() => {
    const checks = this.runtime().readiness.checks;
    if (checks.length === 0) {
      return [];
    }
    return checks
      .filter(check => !check.ready && !this.dismissedBannerKeys().has(check.key))
      .sort((a, b) => (a.blocking !== b.blocking ? (a.blocking ? -1 : 1) : 0));
  });

  dismissBanner(key: string): void {
    const next = new Set(this.dismissedBannerKeys());
    next.add(key);
    this.dismissedBannerKeys.set(next);
  }

  readonly hasConversationTrace = computed(() => {
    const trace = this.runtime().conversationTrace;
    return trace.totalStageCount > 0 || trace.recentTurns.length > 0;
  });

  readonly runtimeTraceOverviewItems = computed<SummaryMetricItem[]>(() => {
    const trace = this.runtime().conversationTrace;
    const successRate =
      trace.totalStageCount > 0
        ? `${Math.round((trace.successfulStageCount / trace.totalStageCount) * 100)}%`
        : this.t('dashboard.values.noRecords');

    return [
      {
        title: 'dashboard.runtimeTrace.executedStages.title',
        value: trace.totalStageCount,
        description: 'dashboard.runtimeTrace.executedStages.description',
        severity: 'info'
      },
      {
        title: 'dashboard.runtimeTrace.successfulStages.title',
        value: trace.successfulStageCount,
        description: this.t('dashboard.runtimeTrace.successfulStages.description', { rate: successRate }),
        severity: 'success'
      },
      {
        title: 'dashboard.runtimeTrace.failedStages.title',
        value: trace.failedStageCount,
        description: 'dashboard.runtimeTrace.failedStages.description',
        severity: trace.failedStageCount > 0 ? 'warn' : 'success'
      },
      {
        title: 'dashboard.runtimeTrace.fallbackStages.title',
        value: trace.fallbackStageCount,
        description: 'dashboard.runtimeTrace.fallbackStages.description',
        severity: trace.fallbackStageCount > 0 ? 'info' : 'secondary'
      }
    ];
  });

  readonly runtimeStageAggregateItems = computed<SummaryMetricItem[]>(() =>
    this.runtime().conversationTrace.stageAggregates.map(aggregate => this.toRuntimeStageAggregateItem(aggregate))
  );

  readonly runtimeStageAggregateColumns = computed(() =>
    Math.min(Math.max(this.runtimeStageAggregateItems().length, 1), 3)
  );

  readonly runtimeRecentTurnItems = computed<SummaryMetricItem[]>(() =>
    this.runtime()
      .conversationTrace.recentTurns.slice(0, 6)
      .map(turn => this.toRuntimeRecentTurnItem(turn))
  );

  readonly runtimeRecentTurnColumns = computed(() => Math.min(Math.max(this.runtimeRecentTurnItems().length, 1), 3));

  ngOnInit(): void {
    this.loadSnapshot();
    this.i18n.translations$.pipe(skip(1), takeUntilDestroyed(this.destroyRef)).subscribe(() => {
      this.loadSnapshot();
    });
  }

  loadSnapshot(): void {
    this.errorMessage.set('');
    this.loading.set(true);

    this.dashboardService
      .getSnapshot()
      .pipe(finalize(() => this.loading.set(false)))
      .subscribe({
        next: (snapshot: DashboardSnapshot) => {
          this.metrics.set(snapshot.metrics);
          this.panels.set(snapshot.panels);
          this.runtime.set(snapshot.runtime);
          this.runtimeServices.set(snapshot.runtime.services);
        },
        error: (error: { error?: { msg?: string }; message?: string }) => {
          this.errorMessage.set(error.error?.msg || error.message || 'dashboard.loadFailed');
        }
      });
  }

  formatDateTime(value: string): string {
    if (!value) {
      return '-';
    }

    const date = new Date(value);
    if (Number.isNaN(date.getTime())) {
      return value;
    }

    return date.toLocaleString(this.i18n.currentLocale === 'zh-TW' ? 'zh-TW' : 'zh-CN', { hour12: false });
  }

  getRuntimeBadgeLabel(): string {
    const r = this.runtime();
    if (!r.runtimeEnabled) return 'dashboard.runtimeBadge.disabled';
    return r.readiness.ready ? 'dashboard.runtimeBadge.ready' : 'dashboard.runtimeBadge.pending';
  }

  getRuntimeBadgeSeverity(): DashboardSeverity {
    const r = this.runtime();
    if (!r.runtimeEnabled) return 'secondary';
    return r.readiness.ready ? 'success' : r.readiness.severity;
  }

  private toRuntimeStageAggregateItem(aggregate: DashboardRuntimeStageAggregate): SummaryMetricItem {
    const lastSeenCopy = aggregate.lastSeenAtUtc
      ? this.t('dashboard.snapshot.runtimeStageAggregate.lastSeen', {
          time: this.formatDateTime(aggregate.lastSeenAtUtc)
        })
      : '';
    return {
      title: aggregate.stage,
      value: aggregate.totalCount,
      description: this.t('dashboard.snapshot.runtimeStageAggregate.description', {
        successCount: String(aggregate.successfulCount),
        failedCount: String(aggregate.failedCount),
        fallbackCount: String(aggregate.fallbackCount),
        lastSeen: lastSeenCopy
      }),
      severity: aggregate.failedCount > 0 ? 'warn' : aggregate.fallbackCount > 0 ? 'info' : 'success'
    };
  }

  private toRuntimeRecentTurnItem(turn: DashboardRuntimeRecentTurn): SummaryMetricItem {
    const outcomeLabel = this.formatTurnOutcome(turn.outcome, turn.succeeded);
    const failureCopy = turn.failureReason
      ? this.t('dashboard.snapshot.runtimeRecentTurn.failureReason', { reason: turn.failureReason })
      : '';
    const errorCopy = turn.errorCode
      ? this.t('dashboard.snapshot.runtimeRecentTurn.errorCode', { code: turn.errorCode })
      : '';
    return {
      title: outcomeLabel,
      value: turn.succeeded ? 'dashboard.values.success' : 'dashboard.values.failure',
      description: this.t('dashboard.snapshot.runtimeRecentTurn.description', {
        time: this.formatDateTime(turn.recordedAtUtc),
        deviceId: turn.deviceId || '-',
        stageCount: String(turn.stageCount),
        failedStageCount: String(turn.failedStageCount),
        fallbackStageCount: String(turn.fallbackStageCount),
        sessionId: turn.sessionId || this.t('dashboard.snapshot.runtimeRecentTurn.noSessionId'),
        failureReason: failureCopy,
        errorCode: errorCopy
      }),
      severity: turn.succeeded ? (turn.fallbackStageCount > 0 ? 'info' : 'success') : 'danger'
    };
  }

  private toSummaryMetricItem(metric: DashboardMetric): SummaryMetricItem {
    return {
      title: metric.title,
      value: metric.value,
      description: metric.description,
      severity: metric.severity
    };
  }

  private orderByPriority<T extends { key: string }>(
    items: T[],
    priorities: Record<DashboardLayoutKey, string[]>
  ): T[] {
    const orderedKeys = priorities['baseline'];
    const sortIndex = new Map(orderedKeys.map((key, index) => [key, index]));

    return items
      .map((item, index) => ({ item, index }))
      .sort((left, right) => {
        const leftIndex = sortIndex.get(left.item.key) ?? Number.MAX_SAFE_INTEGER;
        const rightIndex = sortIndex.get(right.item.key) ?? Number.MAX_SAFE_INTEGER;
        return leftIndex === rightIndex ? left.index - right.index : leftIndex - rightIndex;
      })
      .map(entry => entry.item);
  }

  private t(key: string, params?: Record<string, string>): string {
    this.i18n.localeVersion();
    return this.i18n.translate(key, params);
  }

  private formatTurnOutcome(outcome?: string | null, succeeded = false): string {
    switch (outcome) {
      case 'completed':
        return 'dashboard.turnOutcome.completed';
      case 'empty_audio_input':
        return 'dashboard.turnOutcome.emptyAudioInput';
      case 'empty_transcript':
        return 'dashboard.turnOutcome.emptyTranscript';
      case 'empty_reply_text':
        return 'dashboard.turnOutcome.emptyReplyText';
      case 'empty_tts_audio':
        return 'dashboard.turnOutcome.emptyTtsAudio';
      case 'device_not_found':
        return 'dashboard.turnOutcome.deviceNotFound';
      case 'agent_unbound':
        return 'dashboard.turnOutcome.agentUnbound';
      case 'agent_not_found':
        return 'dashboard.turnOutcome.agentNotFound';
      case 'turn_cancelled':
        return 'dashboard.turnOutcome.turnCancelled';
      case 'turn_timed_out':
        return 'dashboard.turnOutcome.turnTimedOut';
      case 'stage_execution_failed':
        return 'dashboard.turnOutcome.stageExecutionFailed';
      default:
        return outcome || (succeeded ? 'dashboard.turnOutcome.completed' : 'dashboard.values.failure');
    }
  }
}
