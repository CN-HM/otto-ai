import { CommonModule } from '@angular/common';
import { Component, OnInit, inject, signal } from '@angular/core';
import { FormBuilder, ReactiveFormsModule } from '@angular/forms';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { finalize, firstValueFrom } from 'rxjs';
import { ButtonModule } from 'primeng/button';
import { CardModule } from 'primeng/card';
import { TagModule } from 'primeng/tag';
import { I18nService } from '../../../core/i18n/i18n.service';
import { TranslatePipe } from '../../../core/i18n/translate.pipe';
import { ApiClientService } from '../../../core/http/api-client.service';
import { ApiResponse } from '../../../core/models/api.models';
import { FeedbackMessageComponent } from '../../../shared/components/feedback-message.component';
import { PageToolbarComponent } from '../../../shared/components/page-toolbar.component';
import { AgentRoleItem } from '../shared/agent-role.models';
import { AgentRoleService } from '../shared/agent-role.service';

interface RuntimeTestStage {
  status?: string;
  durationMs?: number;
  errorMessage?: string | null;
  trace?: Record<string, unknown> | null;
}

interface RuntimeTestMemoryContext {
  libraryId?: string | null;
  libraryName?: string | null;
  entityScope?: string | null;
  entityId?: string | null;
  records?: RuntimeTestMemoryHit[];
}

interface RuntimeTestMemoryHit {
  id?: string | null;
  recordType?: string | null;
  title?: string | null;
  content?: string | null;
  score?: number;
  importance?: number | null;
}

interface RuntimeTestKnowledgeHit {
  datasetId?: string | null;
  documentName?: string | null;
  content?: string | null;
  score?: number;
}

interface RuntimeTestResult {
  sessionId?: string;
  inputMode?: string;
  agentRoleName?: string | null;
  runtimeConfigSource?: string | null;
  transcript?: string | null;
  replyText?: string | null;
  asrStage?: RuntimeTestStage;
  memoryRetrievalStage?: RuntimeTestStage;
  knowledgeRetrievalStage?: RuntimeTestStage;
  llmStage?: RuntimeTestStage;
  ttsStage?: RuntimeTestStage;
  memoryExtractionStage?: RuntimeTestStage;
  knowledge?: {
    hasBindings?: boolean;
    hasHits?: boolean;
    fallbackReplyText?: string | null;
    hits?: RuntimeTestKnowledgeHit[];
  } | null;
  memoryBefore?: RuntimeTestMemoryContext | null;
  memoryAfter?: RuntimeTestMemoryContext | null;
  tts?: { contentType?: string | null; format?: string | null; audioBase64?: string | null; audioSize?: number } | null;
  memoryChangedCount?: number;
  warnings?: string[];
}

@Component({
  selector: 'app-agent-role-runtime-test-page',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterLink,
    ButtonModule,
    CardModule,
    TagModule,
    TranslatePipe,
    FeedbackMessageComponent,
    PageToolbarComponent
  ],
  template: `<section class="runtime-test-page">
    <div class="page-hero">
      <div>
        <h1>{{ 'agentRoles.runtimeTest.title' | translate }}</h1>
        <p>{{ 'agentRoles.runtimeTest.description' | translate }}</p>
      </div>
    </div>

    <app-page-toolbar>
      <a
        pButton
        routerLink="/agent-roles"
        label="{{ 'agentRoles.runtimeTest.backToRoles' | translate }}"
        icon="pi pi-arrow-left"
        severity="secondary"
        size="small"
      ></a>
    </app-page-toolbar>

    <app-feedback-message [text]="feedbackMessage()"></app-feedback-message>

    <div class="layout-grid">
      <p-card [header]="'agentRoles.runtimeTest.inputTitle' | translate">
        <form class="test-form" [formGroup]="form" (ngSubmit)="runTest()">
          @if (selectedRole()) {
            <div class="selected-role-card">
              <div>
                <span>{{ 'agentRoles.runtimeTest.currentRole' | translate }}</span>
                <strong>{{ selectedRole()?.displayName || selectedRole()?.name || selectedRole()?.code }}</strong>
                <small
                  >{{ 'agentRoles.runtimeTest.codeLabel' | translate }}：{{ selectedRole()?.code || '-' }} ｜
                  {{ 'agentRoles.runtimeTest.versionLabel' | translate }}：{{
                    selectedRole()?.currentVersion || ('agentRoles.runtimeTest.draftConfig' | translate)
                  }}</small
                >
              </div>
              <p-tag [value]="roleStatusLabel(selectedRole()?.status)" severity="info"></p-tag>
            </div>
          } @else {
            <div class="selected-role-card">
              <div>
                <span>{{ 'agentRoles.runtimeTest.currentRole' | translate }}</span>
                <strong>{{ 'agentRoles.runtimeTest.noRoleTitle' | translate }}</strong>
                <small>{{ 'agentRoles.runtimeTest.noRoleHint' | translate }}</small>
              </div>
            </div>
          }

          <div class="field-group">
            <label for="userText">{{ 'agentRoles.runtimeTest.textInput' | translate }}</label>
            <textarea
              id="userText"
              class="native-textarea"
              formControlName="userText"
              rows="5"
              placeholder="{{ 'agentRoles.runtimeTest.textPlaceholder' | translate }}"
            ></textarea>
            <span class="field-help">{{ 'agentRoles.runtimeTest.textHelp' | translate }}</span>
          </div>

          <div class="field-group">
            <label>{{ 'agentRoles.runtimeTest.audioInputOptional' | translate }}</label>
            <div class="mic-actions">
              <button
                pButton
                type="button"
                label="{{ 'agentRoles.runtimeTest.startRecording' | translate }}"
                icon="pi pi-microphone"
                severity="secondary"
                size="small"
                (click)="startRecording()"
                [disabled]="recording() || running()"
              ></button>
              <button
                pButton
                type="button"
                label="{{ 'agentRoles.runtimeTest.stopRecording' | translate }}"
                icon="pi pi-stop"
                severity="danger"
                size="small"
                (click)="stopRecording()"
                [disabled]="!recording()"
              ></button>
              <button
                pButton
                type="button"
                label="{{ 'agentRoles.runtimeTest.clearAudio' | translate }}"
                icon="pi pi-trash"
                severity="secondary"
                size="small"
                (click)="discardAudio()"
                [disabled]="recording() || !audioBase64Value()"
              ></button>
            </div>
            @if (recordedAudioUrl()) {
              <audio class="audio-player" controls [src]="recordedAudioUrl()!"></audio>
            }
            <input
              id="audioFile"
              class="native-file"
              type="file"
              accept="audio/*,.wav,.mp3,.pcm,.webm,.ogg,.m4a"
              (change)="onAudioSelected($event)"
            />
            <span class="field-help">{{ 'agentRoles.runtimeTest.audioHelp' | translate }}</span>
          </div>

          <div class="form-actions">
            <button
              pButton
              type="submit"
              label="{{ 'agentRoles.runtimeTest.runTest' | translate }}"
              icon="pi pi-play"
              severity="primary"
              [loading]="running()"
              [disabled]="!pageAgentRoleId() || recording()"
            ></button>
            <button
              pButton
              type="button"
              label="{{ 'agentRoles.runtimeTest.finalizeSession' | translate }}"
              icon="pi pi-check-circle"
              severity="primary"
              [loading]="finalizing()"
              [disabled]="!currentSessionId() || running() || recording()"
              (click)="finalizeSession()"
            ></button>
          </div>
          <span class="field-help">{{ 'agentRoles.runtimeTest.sessionHelp' | translate }}</span>
        </form>
      </p-card>

      <p-card [header]="'agentRoles.runtimeTest.stagesTitle' | translate">
        <div class="stage-list">
          @for (stage of stageRows(); track stage.key) {
            <div class="stage-item">
              <div>
                <strong>{{ stage.label }}</strong>
                <span>{{ stage.description }}</span>
                @if (stage.stage?.errorMessage) {
                  <small class="stage-error">{{ stage.stage?.errorMessage }}</small>
                }
              </div>
              <div class="stage-meta">
                <p-tag [value]="stageStatusLabel(stage.stage)" [severity]="stageSeverity(stage.stage)"></p-tag>
                <small>{{ stage.stage?.durationMs || 0 }} ms</small>
              </div>
            </div>
          }
        </div>
      </p-card>
    </div>

    @if (result()) {
      <div class="result-grid">
        <p-card [header]="'agentRoles.runtimeTest.resultTitle' | translate">
          <div class="result-block">
            <span>{{ 'agentRoles.runtimeTest.transcript' | translate }}</span>
            <p>{{ result()?.transcript || '-' }}</p>
          </div>
          <div class="result-block">
            <span>{{ 'agentRoles.runtimeTest.replyText' | translate }}</span>
            <p>{{ result()?.replyText || '-' }}</p>
          </div>
          @if (audioUrl()) {
            <audio class="audio-player" controls [src]="audioUrl()!"></audio>
          }
          @if ((result()?.warnings?.length || 0) > 0) {
            <div class="warning-list">
              @for (warning of result()?.warnings || []; track warning) {
                <p-tag [value]="warning" severity="warn"></p-tag>
              }
            </div>
          }
        </p-card>

        <p-card [header]="'agentRoles.runtimeTest.knowledgeHitsTitle' | translate">
          @if ((result()?.knowledge?.hits?.length || 0) > 0) {
            <div class="hit-list">
              @for (hit of result()?.knowledge?.hits || []; track $index) {
                <article class="hit-card">
                  <strong>{{ hit.documentName || hit.datasetId || ('agentRoles.runtimeTest.knowledgeSnippet' | translate) }}</strong>
                  <small>score {{ hit.score || 0 | number: '1.3-3' }}</small>
                  <p>{{ hit.content }}</p>
                </article>
              }
            </div>
          } @else {
            <p class="muted">{{ 'agentRoles.runtimeTest.noKnowledgeHits' | translate }}</p>
          }
        </p-card>

        <p-card [header]="'agentRoles.runtimeTest.memoryTitle' | translate">
          <div class="memory-summary">
            <p-tag [value]="('agentRoles.runtimeTest.memoryWrites' | translate) + (result()?.memoryChangedCount || 0)" severity="info"></p-tag>
            <span>{{ result()?.memoryAfter?.libraryName || result()?.memoryBefore?.libraryName || ('agentRoles.runtimeTest.noMemoryLibrary' | translate) }}</span>
          </div>
          <div class="hit-list">
            @for (memory of memoryRecords(); track memory.id || $index) {
              <article class="hit-card">
                <strong>{{ memory.title || memory.recordType || ('agentRoles.runtimeTest.memoryRecord' | translate) }}</strong>
                <small
                  >score {{ memory.score || 0 | number: '1.3-3' }} ｜ importance {{ memory.importance || 0 }}</small
                >
                <p>{{ memory.content }}</p>
              </article>
            } @empty {
              <p class="muted">{{ 'agentRoles.runtimeTest.noMemoryRecall' | translate }}</p>
            }
          </div>
        </p-card>
      </div>
    }
  </section>`,
  styleUrls: ['./agent-role-runtime-test-page.component.css']
})
export class AgentRoleRuntimeTestPageComponent implements OnInit {
  private readonly formBuilder = inject(FormBuilder);
  private readonly route = inject(ActivatedRoute);
  private readonly api = inject(ApiClientService);
  private readonly agentRoleService = inject(AgentRoleService);
  private readonly i18n = inject(I18nService);

  readonly selectedRole = signal<AgentRoleItem | null>(null);
  readonly pageAgentRoleId = signal('');
  readonly running = signal(false);
  readonly finalizing = signal(false);
  readonly recording = signal(false);
  readonly feedbackMessage = signal('');
  readonly result = signal<RuntimeTestResult | null>(null);
  readonly currentSessionId = signal('');
  readonly audioUrl = signal<string | null>(null);
  readonly recordedAudioUrl = signal<string | null>(null);
  readonly audioBase64Value = signal('');

  private mediaRecorder?: MediaRecorder;
  private recordingStream?: MediaStream;
  private recordingChunks: Blob[] = [];
  private audioBase64 = '';
  private audioFormat = '';

  readonly form = this.formBuilder.nonNullable.group({
    userText: ['']
  });

  async ngOnInit(): Promise<void> {
    const roleId = this.route.snapshot.paramMap.get('id') || '';
    this.pageAgentRoleId.set(roleId);
    if (!roleId) {
      this.feedbackMessage.set(this.i18n.translate('agentRoles.runtimeTest.enterFromList'));
      return;
    }
    await this.loadRole(roleId);
  }

  async loadRole(roleId: string): Promise<void> {
    this.feedbackMessage.set('');
    try {
      const response = await firstValueFrom(this.agentRoleService.getDetail(roleId));
      if (response.code !== 0) {
        this.feedbackMessage.set(this.resolveMessage(response.msg, 'agentRoles.runtimeTest.roleLoadFailed'));
        return;
      }
      this.selectedRole.set(response.data ?? null);
    } catch (error: any) {
      this.feedbackMessage.set(this.resolveMessage(error?.error?.msg || error?.message, 'agentRoles.runtimeTest.roleRequestFailed'));
    }
  }

  onAudioSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    const file = input.files?.[0];
    this.discardAudio();
    if (!file) {
      return;
    }

    const extension = file.name.split('.').pop()?.toLowerCase() || '';
    this.audioFormat = extension || file.type || 'wav';
    const reader = new FileReader();
    reader.onload = () => {
      const value = String(reader.result || '');
      this.audioBase64 = value.includes(',') ? value.split(',').pop() || '' : value;
      this.audioBase64Value.set(this.audioBase64);
      this.recordedAudioUrl.set(value);
    };
    reader.readAsDataURL(file);
  }

  async startRecording(): Promise<void> {
    if (this.recording()) {
      return;
    }
    if (!navigator.mediaDevices?.getUserMedia || typeof MediaRecorder === 'undefined') {
      this.feedbackMessage.set(this.i18n.translate('agentRoles.runtimeTest.browserRecordingUnsupported'));
      return;
    }

    try {
      this.feedbackMessage.set('');
      this.discardAudio();
      const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
      const mimeType = this.resolveRecorderMimeType();
      this.recordingStream = stream;
      this.recordingChunks = [];
      this.mediaRecorder = new MediaRecorder(stream, mimeType ? { mimeType } : undefined);
      this.mediaRecorder.ondataavailable = event => {
        if (event.data.size > 0) {
          this.recordingChunks.push(event.data);
        }
      };
      this.mediaRecorder.onstop = () => {
        this.finishRecording(mimeType || this.mediaRecorder?.mimeType || 'audio/webm');
      };
      this.mediaRecorder.start();
      this.recording.set(true);
    } catch (error: any) {
      this.feedbackMessage.set(this.resolveMessage(error?.message, 'agentRoles.runtimeTest.microphoneAccessFailed'));
      this.stopRecordingStream();
      this.recording.set(false);
    }
  }

  stopRecording(): void {
    if (!this.mediaRecorder || this.mediaRecorder.state === 'inactive') {
      this.recording.set(false);
      this.stopRecordingStream();
      return;
    }
    this.mediaRecorder.stop();
    this.recording.set(false);
  }

  discardAudio(): void {
    this.audioBase64 = '';
    this.audioFormat = '';
    this.audioBase64Value.set('');
    this.recordedAudioUrl.set(null);
    this.recordingChunks = [];
  }

  runTest(): void {
    if (this.form.invalid || this.running()) {
      this.form.markAllAsTouched();
      return;
    }
    if (!this.pageAgentRoleId()) {
      this.feedbackMessage.set(this.i18n.translate('agentRoles.runtimeTest.enterFromList'));
      return;
    }

    const raw = this.form.getRawValue();
    const sessionId = this.currentSessionId() || 'admin-test-' + Date.now() + '-' + Math.random().toString(16).slice(2);
    this.currentSessionId.set(sessionId);
    this.feedbackMessage.set('');
    this.result.set(null);
    this.clearAudioUrl();
    this.running.set(true);

    this.api
      .post<RuntimeTestResult>('/admin/agent-roles/runtime-test', {
        agentRoleId: this.pageAgentRoleId(),
        sessionId,
        userText: raw.userText || undefined,
        audioBase64: this.audioBase64 || undefined,
        audioFormat: this.audioFormat || undefined,
        responseFormat: 'wav'
      })
      .pipe(finalize(() => this.running.set(false)))
      .subscribe({
        next: (response: ApiResponse<RuntimeTestResult>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(this.resolveMessage(response.msg, 'agentRoles.runtimeTest.testFailed'));
            return;
          }
          this.result.set(response.data ?? null);
          this.currentSessionId.set(response.data?.sessionId || sessionId);
          this.prepareAudio(response.data ?? null);
        },
        error: (error: any) => {
          this.feedbackMessage.set(this.resolveMessage(error?.error?.msg || error?.message, 'agentRoles.runtimeTest.testRequestFailed'));
        }
      });
  }

  finalizeSession(): void {
    const sessionId = this.currentSessionId();
    if (!sessionId || this.finalizing()) {
      return;
    }

    this.feedbackMessage.set('');
    this.finalizing.set(true);
    this.api
      .post<unknown>('/admin/agent-roles/runtime-test/finalize', { sessionId })
      .pipe(finalize(() => this.finalizing.set(false)))
      .subscribe({
        next: (response: ApiResponse<unknown>) => {
          if (response.code !== 0) {
            this.feedbackMessage.set(this.resolveMessage(response.msg, 'agentRoles.runtimeTest.finalizeFailed'));
            return;
          }
          this.feedbackMessage.set(this.i18n.translate('agentRoles.runtimeTest.finalizeSuccess'));
          this.currentSessionId.set('');
        },
        error: (error: any) => {
          this.feedbackMessage.set(this.resolveMessage(error?.error?.msg || error?.message, 'agentRoles.runtimeTest.finalizeRequestFailed'));
        }
      });
  }
  stageRows(): { key: string; label: string; description: string; stage?: RuntimeTestStage }[] {
    const current = this.result();
    return [
      {
        key: 'asr',
        label: this.i18n.translate('agentRoles.runtimeTest.stages.asr.label'),
        description: this.i18n.translate('agentRoles.runtimeTest.stages.asr.description'),
        stage: current?.asrStage
      },
      {
        key: 'memory',
        label: this.i18n.translate('agentRoles.runtimeTest.stages.memory.label'),
        description: this.i18n.translate('agentRoles.runtimeTest.stages.memory.description'),
        stage: current?.memoryRetrievalStage
      },
      {
        key: 'knowledge',
        label: this.i18n.translate('agentRoles.runtimeTest.stages.knowledge.label'),
        description: this.i18n.translate('agentRoles.runtimeTest.stages.knowledge.description'),
        stage: current?.knowledgeRetrievalStage
      },
      {
        key: 'llm',
        label: this.i18n.translate('agentRoles.runtimeTest.stages.llm.label'),
        description: this.i18n.translate('agentRoles.runtimeTest.stages.llm.description'),
        stage: current?.llmStage
      },
      {
        key: 'tts',
        label: this.i18n.translate('agentRoles.runtimeTest.stages.tts.label'),
        description: this.i18n.translate('agentRoles.runtimeTest.stages.tts.description'),
        stage: current?.ttsStage
      },
      {
        key: 'memory-write',
        label: this.i18n.translate('agentRoles.runtimeTest.stages.memoryWrite.label'),
        description: this.i18n.translate('agentRoles.runtimeTest.stages.memoryWrite.description'),
        stage: current?.memoryExtractionStage
      }
    ];
  }

  memoryRecords(): RuntimeTestMemoryHit[] {
    return this.result()?.memoryAfter?.records?.length
      ? (this.result()?.memoryAfter?.records ?? [])
      : (this.result()?.memoryBefore?.records ?? []);
  }

  stageStatusLabel(stage?: RuntimeTestStage): string {
    const status = stage?.status || 'pending';
    if (status === 'success') return this.i18n.translate('agentRoles.runtimeTest.stageStatus.success');
    if (status === 'failed') return this.i18n.translate('agentRoles.runtimeTest.stageStatus.failed');
    if (status === 'skipped') return this.i18n.translate('agentRoles.runtimeTest.stageStatus.skipped');
    return this.i18n.translate('agentRoles.runtimeTest.stageStatus.pending');
  }

  roleStatusLabel(status?: string | null): string {
    if (!status) {
      return '-';
    }
    if (status === 'inactive') {
      return this.i18n.translate('agentRoles.inactive');
    }
    if (status === 'active') {
      return this.i18n.translate('agentRoles.active');
    }
    return this.i18n.translateUiText(status);
  }

  stageSeverity(stage?: RuntimeTestStage): 'success' | 'danger' | 'secondary' | 'info' {
    const status = stage?.status || 'pending';
    if (status === 'success') return 'success';
    if (status === 'failed') return 'danger';
    if (status === 'skipped') return 'secondary';
    return 'info';
  }

  private prepareAudio(result: RuntimeTestResult | null): void {
    const audioBase64 = result?.tts?.audioBase64;
    if (!audioBase64) {
      return;
    }
    const contentType = result?.tts?.contentType || 'audio/wav';
    this.audioUrl.set(`data:${contentType};base64,${audioBase64}`);
  }

  private clearAudioUrl(): void {
    this.audioUrl.set(null);
  }

  private resolveRecorderMimeType(): string {
    const candidates = ['audio/webm;codecs=opus', 'audio/webm', 'audio/ogg;codecs=opus', 'audio/ogg', 'audio/mp4'];
    return candidates.find(type => MediaRecorder.isTypeSupported(type)) || '';
  }

  private finishRecording(mimeType: string): void {
    const blob = new Blob(this.recordingChunks, { type: mimeType || 'audio/webm' });
    this.stopRecordingStream();
    if (blob.size === 0) {
      this.feedbackMessage.set(this.i18n.translate('agentRoles.runtimeTest.emptyRecording'));
      return;
    }
    this.audioFormat = this.mimeTypeToAudioFormat(blob.type);
    const reader = new FileReader();
    reader.onload = () => {
      const value = String(reader.result || '');
      this.audioBase64 = value.includes(',') ? value.split(',').pop() || '' : value;
      this.audioBase64Value.set(this.audioBase64);
      this.recordedAudioUrl.set(value);
    };
    reader.readAsDataURL(blob);
  }

  private stopRecordingStream(): void {
    this.recordingStream?.getTracks().forEach(track => track.stop());
    this.recordingStream = undefined;
    this.mediaRecorder = undefined;
  }

  private mimeTypeToAudioFormat(mimeType: string): string {
    const normalized = mimeType.toLowerCase();
    if (normalized.includes('ogg')) return 'ogg';
    if (normalized.includes('mp4') || normalized.includes('m4a')) return 'm4a';
    if (normalized.includes('wav')) return 'wav';
    if (normalized.includes('mpeg') || normalized.includes('mp3')) return 'mp3';
    return 'webm';
  }

  private resolveMessage(message: string | null | undefined, fallbackKey: string): string {
    return message ? this.i18n.translateUiText(message) : this.i18n.translate(fallbackKey);
  }
}
