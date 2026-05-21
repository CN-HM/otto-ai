import { Component, ElementRef, ViewChild, AfterViewInit, OnDestroy, forwardRef, input, effect } from '@angular/core';
import { ControlValueAccessor, NG_VALUE_ACCESSOR } from '@angular/forms';
import { TranslatePipe } from '../../core/i18n/translate.pipe';
import { EditorView, keymap, lineNumbers, highlightActiveLine, highlightActiveLineGutter } from '@codemirror/view';
import { EditorState, Compartment } from '@codemirror/state';
import { json, jsonParseLinter } from '@codemirror/lang-json';
import { linter, lintGutter } from '@codemirror/lint';
import { syntaxHighlighting, bracketMatching, foldGutter, indentOnInput, HighlightStyle } from '@codemirror/language';
import { defaultKeymap, indentWithTab, history, historyKeymap } from '@codemirror/commands';
import { tags } from '@lezer/highlight';

const darkHighlight = HighlightStyle.define([
  { tag: tags.propertyName, color: '#6ee7b7' },
  { tag: tags.string, color: '#fbbf24' },
  { tag: tags.number, color: '#818cf8' },
  { tag: tags.bool, color: '#f472b6' },
  { tag: tags.null, color: '#64648a' },
  { tag: tags.punctuation, color: '#9d9db5' }
]);

const darkTheme = EditorView.theme(
  {
    '&': {
      backgroundColor: '#0c0c10',
      color: '#f0f0f5',
      fontSize: '13px',
      borderRadius: '8px',
      border: '1px solid rgba(255,255,255,0.06)'
    },
    '.cm-content': {
      fontFamily: "'JetBrains Mono', 'Fira Code', 'Consolas', monospace",
      padding: '8px 0',
      caretColor: '#6ee7b7'
    },
    '.cm-cursor': { borderLeftColor: '#6ee7b7' },
    '&.cm-focused': { outline: '1px solid rgba(110,231,183,0.4)' },
    '.cm-gutters': {
      backgroundColor: '#07070a',
      color: '#64648a',
      border: 'none',
      borderRadius: '8px 0 0 8px'
    },
    '.cm-activeLineGutter': { backgroundColor: 'rgba(255,255,255,0.04)' },
    '.cm-activeLine': { backgroundColor: 'rgba(255,255,255,0.03)' },
    '.cm-selectionBackground': { backgroundColor: 'rgba(110,231,183,0.15) !important' },
    '&.cm-focused .cm-selectionBackground': { backgroundColor: 'rgba(110,231,183,0.2) !important' },
    '.cm-matchingBracket': { backgroundColor: 'rgba(110,231,183,0.25)', color: '#6ee7b7 !important' },
    '.cm-foldGutter .cm-gutterElement': { color: '#64648a' },
    '.cm-lint-marker-error': { content: 'none' },
    '.cm-diagnostic-error': {
      backgroundColor: 'rgba(239,68,68,0.1)',
      borderLeft: '3px solid #ef4444',
      color: '#fca5a5'
    },
    '.cm-lintRange-error': { backgroundImage: 'none', textDecoration: 'underline wavy #ef4444' }
  },
  { dark: true }
);

const jsonParseLinterAllowingEmpty = (() => {
  const baseLinter = jsonParseLinter();
  return (view: EditorView) => {
    if (!view.state.doc.toString().trim()) {
      return [];
    }

    return baseLinter(view);
  };
})();

@Component({
  selector: 'app-json-editor',
  standalone: true,
  imports: [TranslatePipe],
  template: `
    <div class="json-editor-wrap">
      <div #editorHost class="json-editor-host"></div>
      <div class="json-editor-toolbar">
        <button
          type="button"
          class="toolbar-btn"
          [attr.title]="'shared.jsonEditor.format' | translate"
          (click)="formatJson()"
        >
          <i class="pi pi-align-justify"></i> {{ 'shared.jsonEditor.format' | translate }}
        </button>
        <span class="json-status" [class.json-status-error]="!!parseError">
          {{ parseError || ('shared.jsonEditor.valid' | translate) }}
        </span>
      </div>
    </div>
  `,
  styles: [
    `
      .json-editor-wrap {
        display: flex;
        flex-direction: column;
        gap: 0;
      }
      .json-editor-host {
        min-height: 180px;
        max-height: 500px;
        overflow: auto;
      }
      .json-editor-host .cm-editor {
        min-height: 180px;
      }
      .json-editor-toolbar {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        padding: 6px 10px;
        background: #07070a;
        border: 1px solid rgba(255, 255, 255, 0.06);
        border-top: none;
        border-radius: 0 0 8px 8px;
        font-size: 12px;
      }
      .toolbar-btn {
        display: inline-flex;
        align-items: center;
        gap: 4px;
        padding: 3px 10px;
        border-radius: 4px;
        background: rgba(255, 255, 255, 0.06);
        border: none;
        color: #9d9db5;
        cursor: pointer;
        font-size: 12px;
        transition: background 0.15s;
      }
      .toolbar-btn:hover {
        background: rgba(255, 255, 255, 0.1);
        color: #f0f0f5;
      }
      .json-status {
        color: #6ee7b7;
        margin-left: auto;
      }
      .json-status-error {
        color: #fca5a5;
      }
    `
  ],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      useExisting: forwardRef(() => JsonEditorComponent),
      multi: true
    }
  ]
})
export class JsonEditorComponent implements ControlValueAccessor, AfterViewInit, OnDestroy {
  @ViewChild('editorHost', { static: true }) hostRef!: ElementRef<HTMLDivElement>;

  readonly minHeight = input(180);

  private view: EditorView | null = null;
  private readonlyCompartment = new Compartment();
  private onChange: (val: string) => void = () => {};
  private onTouched: () => void = () => {};
  private pendingValue: string | null = null;

  parseError = '';

  private heightEffect = effect(() => {
    const h = this.minHeight();
    if (this.view) {
      const host = this.hostRef.nativeElement;
      host.style.minHeight = h + 'px';
    }
  });

  ngAfterViewInit(): void {
    const updateListener = EditorView.updateListener.of(update => {
      if (update.docChanged) {
        const val = update.state.doc.toString();
        this.onChange(val);
        this.validateJson(val);
      }
    });

    const state = EditorState.create({
      doc: this.pendingValue ?? '',
      extensions: [
        lineNumbers(),
        highlightActiveLine(),
        highlightActiveLineGutter(),
        foldGutter(),
        indentOnInput(),
        bracketMatching(),
        history(),
        json(),
        linter(jsonParseLinterAllowingEmpty),
        lintGutter(),
        syntaxHighlighting(darkHighlight),
        darkTheme,
        keymap.of([...defaultKeymap, ...historyKeymap, indentWithTab]),
        updateListener,
        this.readonlyCompartment.of(EditorState.readOnly.of(false)),
        EditorView.lineWrapping
      ]
    });

    this.view = new EditorView({
      state,
      parent: this.hostRef.nativeElement
    });

    if (this.pendingValue !== null) {
      this.validateJson(this.pendingValue);
      this.pendingValue = null;
    }
  }

  ngOnDestroy(): void {
    this.view?.destroy();
  }

  writeValue(value: string): void {
    if (!this.view) {
      this.pendingValue = value ?? '';
      return;
    }
    const current = this.view.state.doc.toString();
    if (value !== current) {
      this.view.dispatch({
        changes: { from: 0, to: this.view.state.doc.length, insert: value ?? '' }
      });
    }
    this.validateJson(value ?? '');
  }

  registerOnChange(fn: (val: string) => void): void {
    this.onChange = fn;
  }
  registerOnTouched(fn: () => void): void {
    this.onTouched = fn;
  }

  setDisabledState(disabled: boolean): void {
    this.view?.dispatch({
      effects: this.readonlyCompartment.reconfigure(EditorState.readOnly.of(disabled))
    });
  }

  formatJson(): void {
    if (!this.view) return;
    const text = this.view.state.doc.toString();
    try {
      const formatted = JSON.stringify(JSON.parse(text), null, 2);
      this.view.dispatch({
        changes: { from: 0, to: this.view.state.doc.length, insert: formatted }
      });
      this.parseError = '';
    } catch {
      // keep current text, error already shown by linter
    }
  }

  private validateJson(text: string): void {
    if (!text.trim()) {
      this.parseError = '';
      return;
    }

    try {
      JSON.parse(text);
      this.parseError = '';
    } catch (e) {
      this.parseError = (e as Error).message.replace(/^JSON\.parse: /, '');
    }
  }
}
