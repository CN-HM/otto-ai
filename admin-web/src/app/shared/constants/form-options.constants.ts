export interface StaticSelectOption {
  label: string;
  value: string;
}

export const AGENT_LANGUAGE_OPTIONS: StaticSelectOption[] = [
  { label: '中文', value: '中文' },
  { label: '台湾', value: '台湾' },
  { label: 'English', value: 'English' },
  { label: '日本語', value: '日本語' },
  { label: '한국어', value: '한국어' },
  { label: 'Français', value: 'Français' },
  { label: 'Deutsch', value: 'Deutsch' }
];

export const AGENT_LANG_CODE_OPTIONS: StaticSelectOption[] = [
  { label: 'zh', value: 'zh' },
  { label: 'zh-TW', value: 'zh-TW' },
  { label: 'en', value: 'en' },
  { label: 'ja', value: 'ja' },
  { label: 'ko', value: 'ko' },
  { label: 'fr', value: 'fr' },
  { label: 'de', value: 'de' }
];

export const VOICE_LANGUAGE_OPTIONS: StaticSelectOption[] = [
  { label: '普通话', value: '普通话' },
  { label: '台湾', value: '台湾' },
  { label: '粤语', value: '粤语' },
  { label: '辽宁', value: '辽宁' },
  { label: '陕西', value: '陕西' },
  { label: '中文', value: '中文' },
  { label: '英语', value: '英语' },
  { label: '日语', value: '日语' },
  { label: '韩语', value: '韩语' },
  { label: '法语', value: '法语' },
  { label: '德语', value: '德语' },
  { label: 'English', value: 'English' },
  { label: '日本語', value: '日本語' },
  { label: '한국어', value: '한국어' },
  { label: 'Français', value: 'Français' },
  { label: 'Deutsch', value: 'Deutsch' }
];

export const SYSTEM_PARAM_VALUE_TYPE_OPTIONS: StaticSelectOption[] = [
  { label: '字符串', value: 'string' },
  { label: '整数', value: 'int' },
  { label: '数字', value: 'number' },
  { label: '浮点数', value: 'float' },
  { label: '布尔', value: 'boolean' },
  { label: '数组', value: 'array' },
  { label: 'JSON', value: 'json' }
];

export const LANGUAGE_TO_CODE_MAP: Record<string, string> = {
  中文: 'zh',
  台湾: 'zh-TW',
  English: 'en',
  日本語: 'ja',
  한국어: 'ko',
  Français: 'fr',
  Deutsch: 'de'
};

export const LANG_CODE_TO_LANGUAGE_MAP: Record<string, string> = {
  zh: '中文',
  'zh-TW': '台湾',
  en: 'English',
  ja: '日本語',
  ko: '한국어',
  fr: 'Français',
  de: 'Deutsch'
};

export function mergeSelectOptions(
  options: readonly StaticSelectOption[],
  ...values: (string | null | undefined)[]
): StaticSelectOption[] {
  const merged = [...options];

  for (const rawValue of values) {
    const value = rawValue?.trim();
    if (!value || merged.some(item => item.value === value || item.label === value)) {
      continue;
    }

    merged.push({ label: value, value });
  }

  return merged;
}
