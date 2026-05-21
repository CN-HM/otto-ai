// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_voice_dtos_timbre_details_vo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesVoiceDtosTimbreDetailsVo
    extends AiAdminServicesVoiceDtosTimbreDetailsVo {
  @override
  final String? id;
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
  final String? providerCode;
  @override
  final String? providerName;
  @override
  final String? ttsProfileId;
  @override
  final String? ttsVoice;
  @override
  final String? voiceDemo;

  factory _$AiAdminServicesVoiceDtosTimbreDetailsVo(
          [void Function(AiAdminServicesVoiceDtosTimbreDetailsVoBuilder)?
              updates]) =>
      (AiAdminServicesVoiceDtosTimbreDetailsVoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesVoiceDtosTimbreDetailsVo._(
      {this.id,
      this.languages,
      this.name,
      this.remark,
      this.referenceAudio,
      this.referenceText,
      this.sort,
      this.providerCode,
      this.providerName,
      this.ttsProfileId,
      this.ttsVoice,
      this.voiceDemo})
      : super._();
  @override
  AiAdminServicesVoiceDtosTimbreDetailsVo rebuild(
          void Function(AiAdminServicesVoiceDtosTimbreDetailsVoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesVoiceDtosTimbreDetailsVoBuilder toBuilder() =>
      AiAdminServicesVoiceDtosTimbreDetailsVoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesVoiceDtosTimbreDetailsVo &&
        id == other.id &&
        languages == other.languages &&
        name == other.name &&
        remark == other.remark &&
        referenceAudio == other.referenceAudio &&
        referenceText == other.referenceText &&
        sort == other.sort &&
        providerCode == other.providerCode &&
        providerName == other.providerName &&
        ttsProfileId == other.ttsProfileId &&
        ttsVoice == other.ttsVoice &&
        voiceDemo == other.voiceDemo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, languages.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jc(_$hash, referenceAudio.hashCode);
    _$hash = $jc(_$hash, referenceText.hashCode);
    _$hash = $jc(_$hash, sort.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, providerName.hashCode);
    _$hash = $jc(_$hash, ttsProfileId.hashCode);
    _$hash = $jc(_$hash, ttsVoice.hashCode);
    _$hash = $jc(_$hash, voiceDemo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesVoiceDtosTimbreDetailsVo')
          ..add('id', id)
          ..add('languages', languages)
          ..add('name', name)
          ..add('remark', remark)
          ..add('referenceAudio', referenceAudio)
          ..add('referenceText', referenceText)
          ..add('sort', sort)
          ..add('providerCode', providerCode)
          ..add('providerName', providerName)
          ..add('ttsProfileId', ttsProfileId)
          ..add('ttsVoice', ttsVoice)
          ..add('voiceDemo', voiceDemo))
        .toString();
  }
}

class AiAdminServicesVoiceDtosTimbreDetailsVoBuilder
    implements
        Builder<AiAdminServicesVoiceDtosTimbreDetailsVo,
            AiAdminServicesVoiceDtosTimbreDetailsVoBuilder> {
  _$AiAdminServicesVoiceDtosTimbreDetailsVo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

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

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  String? _providerName;
  String? get providerName => _$this._providerName;
  set providerName(String? providerName) => _$this._providerName = providerName;

  String? _ttsProfileId;
  String? get ttsProfileId => _$this._ttsProfileId;
  set ttsProfileId(String? ttsProfileId) => _$this._ttsProfileId = ttsProfileId;

  String? _ttsVoice;
  String? get ttsVoice => _$this._ttsVoice;
  set ttsVoice(String? ttsVoice) => _$this._ttsVoice = ttsVoice;

  String? _voiceDemo;
  String? get voiceDemo => _$this._voiceDemo;
  set voiceDemo(String? voiceDemo) => _$this._voiceDemo = voiceDemo;

  AiAdminServicesVoiceDtosTimbreDetailsVoBuilder() {
    AiAdminServicesVoiceDtosTimbreDetailsVo._defaults(this);
  }

  AiAdminServicesVoiceDtosTimbreDetailsVoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _languages = $v.languages;
      _name = $v.name;
      _remark = $v.remark;
      _referenceAudio = $v.referenceAudio;
      _referenceText = $v.referenceText;
      _sort = $v.sort;
      _providerCode = $v.providerCode;
      _providerName = $v.providerName;
      _ttsProfileId = $v.ttsProfileId;
      _ttsVoice = $v.ttsVoice;
      _voiceDemo = $v.voiceDemo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesVoiceDtosTimbreDetailsVo other) {
    _$v = other as _$AiAdminServicesVoiceDtosTimbreDetailsVo;
  }

  @override
  void update(
      void Function(AiAdminServicesVoiceDtosTimbreDetailsVoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesVoiceDtosTimbreDetailsVo build() => _build();

  _$AiAdminServicesVoiceDtosTimbreDetailsVo _build() {
    final _$result = _$v ??
        _$AiAdminServicesVoiceDtosTimbreDetailsVo._(
          id: id,
          languages: languages,
          name: name,
          remark: remark,
          referenceAudio: referenceAudio,
          referenceText: referenceText,
          sort: sort,
          providerCode: providerCode,
          providerName: providerName,
          ttsProfileId: ttsProfileId,
          ttsVoice: ttsVoice,
          voiceDemo: voiceDemo,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
