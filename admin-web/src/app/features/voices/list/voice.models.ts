export interface VoiceItem {
  id?: string;
  languages?: string;
  name?: string;
  providerCode?: string;
  providerName?: string;
  remark?: string;
  sort?: number;
  ttsProfileId?: string;
  ttsVoice?: string;
  voiceDemo?: string;
}

export interface VoicePageData {
  total: number;
  list: VoiceItem[];
}

export interface VoicePageQuery {
  ttsProfileId: string;
  name?: string;
  page: number;
  limit: number;
}

export interface VoicePayload {
  id?: string;
  languages?: string;
  name?: string;
  providerCode?: string;
  providerName?: string;
  remark?: string;
  sort?: number;
  ttsProfileId?: string;
  ttsVoice?: string;
  voiceDemo?: string;
}

export interface TtsProfileOption {
  label: string;
  value: string;
  description?: string | null;
  profileName?: string | null;
  integrationId?: string | null;
  providerCode?: string | null;
  providerName?: string | null;
}
