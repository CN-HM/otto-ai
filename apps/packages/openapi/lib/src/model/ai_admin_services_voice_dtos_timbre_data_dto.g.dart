// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_voice_dtos_timbre_data_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesVoiceDtosTimbreDataDto
    extends AiAdminServicesVoiceDtosTimbreDataDto {
  @override
  final String? languages;
  @override
  final String? name;
  @override
  final String? remark;
  @override
  final String? referenceAudio;
  @override
  final String? referenceText;
  @override
  final int? sort;
  @override
  final String? ttsProfileId;
  @override
  final String? ttsVoice;
  @override
  final String? voiceDemo;

  factory _$AiAdminServicesVoiceDtosTimbreDataDto(
          [void Function(AiAdminServicesVoiceDtosTimbreDataDtoBuilder)?
              updates]) =>
      (AiAdminServicesVoiceDtosTimbreDataDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesVoiceDtosTimbreDataDto._(
      {this.languages,
      this.name,
      this.remark,
      this.referenceAudio,
      this.referenceText,
      this.sort,
      this.ttsProfileId,
      this.ttsVoice,
      this.voiceDemo})
      : super._();
  @override
  AiAdminServicesVoiceDtosTimbreDataDto rebuild(
          void Function(AiAdminServicesVoiceDtosTimbreDataDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesVoiceDtosTimbreDataDtoBuilder toBuilder() =>
      AiAdminServicesVoiceDtosTimbreDataDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesVoiceDtosTimbreDataDto &&
        languages == other.languages &&
        name == other.name &&
        remark == other.remark &&
        referenceAudio == other.referenceAudio &&
        referenceText == other.referenceText &&
        sort == other.sort &&
        ttsProfileId == other.ttsProfileId &&
        ttsVoice == other.ttsVoice &&
        voiceDemo == other.voiceDemo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, languages.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jc(_$hash, referenceAudio.hashCode);
    _$hash = $jc(_$hash, referenceText.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, ttsProfileId.hashCode);
    _$hash = $jc(_$hash, ttsVoice.hashCode);
    _$hash = $jc(_$hash, voiceDemo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesVoiceDtosTimbreDataDto')
          ..add('languages', languages)
          ..add('name', name)
          ..add('remark', remark)
          ..add('referenceAudio', referenceAudio)
          ..add('referenceText', referenceText)
          ..add('sort', sort)
          ..add('ttsProfileId', ttsProfileId)
          ..add('ttsVoice', ttsVoice)
          ..add('voiceDemo', voiceDemo))
        .toString();
  }
}

class AiAdminServicesVoiceDtosTimbreDataDtoBuilder
    implements
        Builder<AiAdminServicesVoiceDtosTimbreDataDto,
            AiAdminServicesVoiceDtosTimbreDataDtoBuilder> {
  _$AiAdminServicesVoiceDtosTimbreDataDto? _$v;

  String? _languages;
  String? get languages => _$this._languages;
  set languages(String? languages) => _$this._languages = languages;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _remark;
  String? get remark => _$this._remark;
  set remark(String? remark) => _$this._remark = remark;

  String? _referenceAudio;
  String? get referenceAudio => _$this._referenceAudio;
  set referenceAudio(String? referenceAudio) =>
      _$this._referenceAudio = referenceAudio;

  String? _referenceText;
  String? get referenceText => _$this._referenceText;
  set referenceText(String? referenceText) =>
      _$this._referenceText = referenceText;

  int? _sort;
  int? get sort => _$this._sort;
  set sort(int? sort) => _$this._sort = sort;

  String? _ttsProfileId;
  String? get ttsProfileId => _$this._ttsProfileId;
  set ttsProfileId(String? ttsProfileId) => _$this._ttsProfileId = ttsProfileId;

  String? _ttsVoice;
  String? get ttsVoice => _$this._ttsVoice;
  set ttsVoice(String? ttsVoice) => _$this._ttsVoice = ttsVoice;

  String? _voiceDemo;
  String? get voiceDemo => _$this._voiceDemo;
  set voiceDemo(String? voiceDemo) => _$this._voiceDemo = voiceDemo;

  AiAdminServicesVoiceDtosTimbreDataDtoBuilder() {
    AiAdminServicesVoiceDtosTimbreDataDto._defaults(this);
  }

  AiAdminServicesVoiceDtosTimbreDataDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _languages = $v.languages;
      _name = $v.name;
      _remark = $v.remark;
      _referenceAudio = $v.referenceAudio;
      _referenceText = $v.referenceText;
      _sort = $v.sort;
      _ttsProfileId = $v.ttsProfileId;
      _ttsVoice = $v.ttsVoice;
      _voiceDemo = $v.voiceDemo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesVoiceDtosTimbreDataDto other) {
    _$v = other as _$AiAdminServicesVoiceDtosTimbreDataDto;
  }

  @override
  void update(
      void Function(AiAdminServicesVoiceDtosTimbreDataDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesVoiceDtosTimbreDataDto build() => _build();

  _$AiAdminServicesVoiceDtosTimbreDataDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesVoiceDtosTimbreDataDto._(
          languages: languages,
          name: name,
          remark: remark,
          referenceAudio: referenceAudio,
          referenceText: referenceText,
          sort: sort,
          ttsProfileId: ttsProfileId,
          ttsVoice: ttsVoice,
          voiceDemo: voiceDemo,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
