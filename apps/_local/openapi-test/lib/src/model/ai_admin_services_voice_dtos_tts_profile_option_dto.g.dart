// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_voice_dtos_tts_profile_option_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesVoiceDtosTtsProfileOptionDto
    extends AiAdminServicesVoiceDtosTtsProfileOptionDto {
  @override
  final String? label;
  @override
  final String? value;
  @override
  final String? description;
  @override
  final String? profileName;
  @override
  final String? integrationId;
  @override
  final String? providerCode;
  @override
  final String? providerName;

  factory _$AiAdminServicesVoiceDtosTtsProfileOptionDto(
          [void Function(AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder)?
              updates]) =>
      (AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesVoiceDtosTtsProfileOptionDto._(
      {this.label,
      this.value,
      this.description,
      this.profileName,
      this.integrationId,
      this.providerCode,
      this.providerName})
      : super._();
  @override
  AiAdminServicesVoiceDtosTtsProfileOptionDto rebuild(
          void Function(AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder toBuilder() =>
      AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesVoiceDtosTtsProfileOptionDto &&
        label == other.label &&
        value == other.value &&
        description == other.description &&
        profileName == other.profileName &&
        integrationId == other.integrationId &&
        providerCode == other.providerCode &&
        providerName == other.providerName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, profileName.hashCode);
    _$hash = $jc(_$hash, integrationId.hashCode);
    _$hash = $jc(_$hash, providerCode.hashCode);
    _$hash = $jc(_$hash, providerName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesVoiceDtosTtsProfileOptionDto')
          ..add('label', label)
          ..add('value', value)
          ..add('description', description)
          ..add('profileName', profileName)
          ..add('integrationId', integrationId)
          ..add('providerCode', providerCode)
          ..add('providerName', providerName))
        .toString();
  }
}

class AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder
    implements
        Builder<AiAdminServicesVoiceDtosTtsProfileOptionDto,
            AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder> {
  _$AiAdminServicesVoiceDtosTtsProfileOptionDto? _$v;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _profileName;
  String? get profileName => _$this._profileName;
  set profileName(String? profileName) => _$this._profileName = profileName;

  String? _integrationId;
  String? get integrationId => _$this._integrationId;
  set integrationId(String? integrationId) =>
      _$this._integrationId = integrationId;

  String? _providerCode;
  String? get providerCode => _$this._providerCode;
  set providerCode(String? providerCode) => _$this._providerCode = providerCode;

  String? _providerName;
  String? get providerName => _$this._providerName;
  set providerName(String? providerName) => _$this._providerName = providerName;

  AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder() {
    AiAdminServicesVoiceDtosTtsProfileOptionDto._defaults(this);
  }

  AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _label = $v.label;
      _value = $v.value;
      _description = $v.description;
      _profileName = $v.profileName;
      _integrationId = $v.integrationId;
      _providerCode = $v.providerCode;
      _providerName = $v.providerName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesVoiceDtosTtsProfileOptionDto other) {
    _$v = other as _$AiAdminServicesVoiceDtosTtsProfileOptionDto;
  }

  @override
  void update(
      void Function(AiAdminServicesVoiceDtosTtsProfileOptionDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesVoiceDtosTtsProfileOptionDto build() => _build();

  _$AiAdminServicesVoiceDtosTtsProfileOptionDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesVoiceDtosTtsProfileOptionDto._(
          label: label,
          value: value,
          description: description,
          profileName: profileName,
          integrationId: integrationId,
          providerCode: providerCode,
          providerName: providerName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
