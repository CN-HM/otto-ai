import { AfterViewInit, Directive, ElementRef, OnDestroy, inject } from '@angular/core';
import { Subscription } from 'rxjs';
import { I18nService } from './i18n.service';

const translatedAttributes = ['placeholder', 'title', 'aria-label', 'alt'];
const skippedTags = new Set(['SCRIPT', 'STYLE', 'CODE', 'PRE', 'TEXTAREA', 'NOSCRIPT', 'SVG']);

@Directive({
  selector: '[appDomI18n]',
  standalone: true
})
export class DomI18nDirective implements AfterViewInit, OnDestroy {
  private readonly elementRef = inject<ElementRef<HTMLElement>>(ElementRef);
  private readonly i18n = inject(I18nService);
  private readonly textOriginals = new WeakMap<Text, string>();
  private readonly attrOriginals = new WeakMap<Element, Map<string, string>>();
  private readonly subscriptions = new Subscription();
  private observer: MutationObserver | null = null;
  private scheduled = false;

  ngAfterViewInit(): void {
    this.observer = new MutationObserver(() => this.scheduleApply());
    this.observer.observe(this.elementRef.nativeElement, {
      childList: true,
      subtree: true,
      characterData: true,
      attributes: true,
      attributeFilter: translatedAttributes
    });
    this.subscriptions.add(this.i18n.currentLocale$.subscribe(() => this.scheduleApply()));
    this.subscriptions.add(this.i18n.translations$.subscribe(() => this.scheduleApply()));
    this.scheduleApply();
  }

  ngOnDestroy(): void {
    this.observer?.disconnect();
    this.subscriptions.unsubscribe();
  }

  private scheduleApply(): void {
    if (this.scheduled) {
      return;
    }

    this.scheduled = true;
    queueMicrotask(() => {
      this.scheduled = false;
      this.applyTranslations();
    });
  }

  private applyTranslations(): void {
    const root = this.elementRef.nativeElement;
    this.translateElementAttributes(root);
    this.walk(root);
  }

  private walk(node: Node): void {
    if (node.nodeType === Node.TEXT_NODE) {
      this.translateTextNode(node as Text);
      return;
    }

    if (node.nodeType !== Node.ELEMENT_NODE) {
      return;
    }

    const element = node as Element;
    this.translateElementAttributes(element);
    if (skippedTags.has(element.tagName)) {
      return;
    }

    for (const child of Array.from(element.childNodes)) {
      this.walk(child);
    }
  }

  private translateTextNode(node: Text): void {
    const current = node.nodeValue ?? '';
    const existingOriginal = this.textOriginals.get(node);
    const original = existingOriginal ?? current;

    if (!existingOriginal && /[\u4e00-\u9fff]/.test(original)) {
      this.textOriginals.set(node, original);
    }

    const translated = this.i18n.translateUiText(original);
    if (current !== translated) {
      node.nodeValue = translated;
    }
  }

  private translateElementAttributes(element: Element): void {
    for (const attr of translatedAttributes) {
      const current = element.getAttribute(attr);
      if (!current || !/[\u4e00-\u9fff]/.test(current)) {
        continue;
      }

      let originals = this.attrOriginals.get(element);
      if (!originals) {
        originals = new Map<string, string>();
        this.attrOriginals.set(element, originals);
      }

      const original = originals.get(attr) ?? current;
      if (!originals.has(attr)) {
        originals.set(attr, original);
      }

      const translated = this.i18n.translateUiText(original);
      if (current !== translated) {
        element.setAttribute(attr, translated);
      }
    }
  }
}
