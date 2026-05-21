// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_admin_dtos_admin_system_runtime_settings_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto
    extends AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto {
  @override
  final bool? deleteAudio;
  @override
  final int? closeConnectionNoVoiceTime;
  @override
  final int? ttsTimeout;
  @override
  final bool? enableWakeupWordsResponseCache;
  @override
  final bool? enableGreeting;
  @override
  final bool? enableStopTtsNotify;
  @override
  final String? stopTtsNotifyVoice;
  @override
  final String? exitCommands;
  @override
  final String? AI;
  @override
  final String? wakeupWords;
  @override
  final int? deviceMaxOutputSize;
  @override
  final String? voiceprintUrl;
  @override
  final double? voiceprintSimilarityThreshold;

  factory _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto(
          [void Function(
                  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder)?
              updates]) =>
      (AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto._(
      {this.deleteAudio,
      this.closeConnectionNoVoiceTime,
      this.ttsTimeout,
      this.enableWakeupWordsResponseCache,
      this.enableGreeting,
      this.enableStopTtsNotify,
      this.stopTtsNotifyVoice,
      this.exitCommands,
      this.AI,
      this.wakeupWords,
      this.deviceMaxOutputSize,
      this.voiceprintUrl,
      this.voiceprintSimilarityThreshold})
      : super._();
  @override
  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto rebuild(
          void Function(
                  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder toBuilder() =>
      AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto &&
        deleteAudio == other.deleteAudio &&
        closeConnectionNoVoiceTime == other.closeConnectionNoVoiceTime &&
        ttsTimeout == other.ttsTimeout &&
        enableWakeupWordsResponseCache ==
            other.enableWakeupWordsResponseCache &&
        enableGreeting == other.enableGreeting &&
        enableStopTtsNotify == other.enableStopTtsNotify &&
        stopTtsNotifyVoice == other.stopTtsNotifyVoice &&
        exitCommands == other.exitCommands &&
        AI == other.AI &&
        wakeupWords == other.wakeupWords &&
        deviceMaxOutputSize == other.deviceMaxOutputSize &&
        voiceprintUrl == other.voiceprintUrl &&
        voiceprintSimilarityThreshold == other.voiceprintSimilarityThreshold;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deleteAudio.hashCode);
    _$hash = $jc(_$hash, closeConnectionNoVoiceTime.hashCode);
    _$hash = $jc(_$hash, ttsTimeout.hashCode);
    _$hash = $jc(_$hash, enableWakeupWordsResponseCache.hashCode);
    _$hash = $jc(_$hash, enableGreeting.hashCode);
    _$hash = $jc(_$hash, enableStopTtsNotify.hashCode);
    _$hash = $jc(_$hash, stopTtsNotifyVoice.hashCode);
    _$hash = $jc(_$hash, exitCommands.hashCode);
    _$hash = $jc(_$hash, AI.hashCode);
    _$hash = $jc(_$hash, wakeupWords.hashCode);
    _$hash = $jc(_$hash, deviceMaxOutputSize.hashCode);
    _$hash = $jc(_$hash, voiceprintUrl.hashCode);
    _$hash = $jc(_$hash, voiceprintSimilarityThreshold.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto')
          ..add('deleteAudio', deleteAudio)
          ..add('closeConnectionNoVoiceTime', closeConnectionNoVoiceTime)
          ..add('ttsTimeout', ttsTimeout)
          ..add(
              'enableWakeupWordsResponseCache', enableWakeupWordsResponseCache)
          ..add('enableGreeting', enableGreeting)
          ..add('enableStopTtsNotify', enableStopTtsNotify)
          ..add('stopTtsNotifyVoice', stopTtsNotifyVoice)
          ..add('exitCommands', exitCommands)
          ..add('AI', AI)
          ..add('wakeupWords', wakeupWords)
          ..add('deviceMaxOutputSize', deviceMaxOutputSize)
          ..add('voiceprintUrl', voiceprintUrl)
          ..add('voiceprintSimilarityThreshold', voiceprintSimilarityThreshold))
        .toString();
  }
}

class AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder
    implements
        Builder<AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto,
            AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder> {
  _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto? _$v;

  bool? _deleteAudio;
  bool? get deleteAudio => _$this._deleteAudio;
  set deleteAudio(bool? deleteAudio) => _$this._deleteAudio = deleteAudio;

  int? _closeConnectionNoVoiceTime;
  int? get closeConnectionNoVoiceTime => _$this._closeConnectionNoVoiceTime;
  set closeConnectionNoVoiceTime(int? closeConnectionNoVoiceTime) =>
      _$this._closeConnectionNoVoiceTime = closeConnectionNoVoiceTime;

  int? _ttsTimeout;
  int? get ttsTimeout => _$this._ttsTimeout;
  set ttsTimeout(int? ttsTimeout) => _$this._ttsTimeout = ttsTimeout;

  bool? _enableWakeupWordsResponseCache;
  bool? get enableWakeupWordsResponseCache =>
      _$this._enableWakeupWordsResponseCache;
  set enableWakeupWordsResponseCache(bool? enableWakeupWordsResponseCache) =>
      _$this._enableWakeupWordsResponseCache = enableWakeupWordsResponseCache;

  bool? _enableGreeting;
  bool? get enableGreeting => _$this._enableGreeting;
  set enableGreeting(bool? enableGreeting) =>
      _$this._enableGreeting = enableGreeting;

  bool? _enableStopTtsNotify;
  bool? get enableStopTtsNotify => _$this._enableStopTtsNotify;
  set enableStopTtsNotify(bool? enableStopTtsNotify) =>
      _$this._enableStopTtsNotify = enableStopTtsNotify;

  String? _stopTtsNotifyVoice;
  String? get stopTtsNotifyVoice => _$this._stopTtsNotifyVoice;
  set stopTtsNotifyVoice(String? stopTtsNotifyVoice) =>
      _$this._stopTtsNotifyVoice = stopTtsNotifyVoice;

  String? _exitCommands;
  String? get exitCommands => _$this._exitCommands;
  set exitCommands(String? exitCommands) => _$this._exitCommands = exitCommands;

  String? _otto;
  String? get AI => _$this._otto;
  set AI(String? AI) => _$this._otto = AI;

  String? _wakeupWords;
  String? get wakeupWords => _$this._wakeupWords;
  set wakeupWords(String? wakeupWords) => _$this._wakeupWords = wakeupWords;

  int? _deviceMaxOutputSize;
  int? get deviceMaxOutputSize => _$this._deviceMaxOutputSize;
  set deviceMaxOutputSize(int? deviceMaxOutputSize) =>
      _$this._deviceMaxOutputSize = deviceMaxOutputSize;

  String? _voiceprintUrl;
  String? get voiceprintUrl => _$this._voiceprintUrl;
  set voiceprintUrl(String? voiceprintUrl) =>
      _$this._voiceprintUrl = voiceprintUrl;

  double? _voiceprintSimilarityThreshold;
  double? get voiceprintSimilarityThreshold =>
      _$this._voiceprintSimilarityThreshold;
  set voiceprintSimilarityThreshold(double? voiceprintSimilarityThreshold) =>
      _$this._voiceprintSimilarityThreshold = voiceprintSimilarityThreshold;

  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder() {
    AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto._defaults(this);
  }

  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deleteAudio = $v.deleteAudio;
      _closeConnectionNoVoiceTime = $v.closeConnectionNoVoiceTime;
      _ttsTimeout = $v.ttsTimeout;
      _enableWakeupWordsResponseCache = $v.enableWakeupWordsResponseCache;
      _enableGreeting = $v.enableGreeting;
      _enableStopTtsNotify = $v.enableStopTtsNotify;
      _stopTtsNotifyVoice = $v.stopTtsNotifyVoice;
      _exitCommands = $v.exitCommands;
      _otto = $v.AI;
      _wakeupWords = $v.wakeupWords;
      _deviceMaxOutputSize = $v.deviceMaxOutputSize;
      _voiceprintUrl = $v.voiceprintUrl;
      _voiceprintSimilarityThreshold = $v.voiceprintSimilarityThreshold;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto other) {
    _$v = other as _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto build() => _build();

  _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAdminDtosAdminSystemRuntimeSettingsDto._(
          deleteAudio: deleteAudio,
          closeConnectionNoVoiceTime: closeConnectionNoVoiceTime,
          ttsTimeout: ttsTimeout,
          enableWakeupWordsResponseCache: enableWakeupWordsResponseCache,
          enableGreeting: enableGreeting,
          enableStopTtsNotify: enableStopTtsNotify,
          stopTtsNotifyVoice: stopTtsNotifyVoice,
          exitCommands: exitCommands,
          AI: AI,
          wakeupWords: wakeupWords,
          deviceMaxOutputSize: deviceMaxOutputSize,
          voiceprintUrl: voiceprintUrl,
          voiceprintSimilarityThreshold: voiceprintSimilarityThreshold,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
