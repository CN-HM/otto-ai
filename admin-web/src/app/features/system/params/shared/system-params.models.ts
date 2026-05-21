export interface AdminSystemServerSettings {
  listenIp: string;
  publicHost: string;
  port: number;
  httpPort: number;
  visionPort: number;
  secret: string;
  allowUserRegister: boolean;
  frontendUrl: string;
}

export interface AdminSystemLogSettings {
  logFormat: string;
  logFormatFile: string;
  logLevel: string;
  logDir: string;
  logFile: string;
  dataDir: string;
}

export interface AdminSystemRuntimeSettings {
  deleteAudio: boolean;
  closeConnectionNoVoiceTime: number;
  ttsTimeout: number;
  enableWakeupWordsResponseCache: boolean;
  enableGreeting: boolean;
  enableStopTtsNotify: boolean;
  stopTtsNotifyVoice: string;
  exitCommands: string;
  iotProtocolConfig: string;
  wakeupWords: string;
  deviceMaxOutputSize?: number | null;
  voiceprintUrl: string;
  voiceprintSimilarityThreshold?: number | null;
}

export interface AdminSystemBillingSettings {
  defaultPlanCode: string;
  resetTimezone: string;
  lowBalanceRatio: number;
  exhaustionRemindCooldownHours: number;
}

export interface AdminSystemSettings {
  server: AdminSystemServerSettings;
  log: AdminSystemLogSettings;
  runtime: AdminSystemRuntimeSettings;
  billing: AdminSystemBillingSettings;
}
