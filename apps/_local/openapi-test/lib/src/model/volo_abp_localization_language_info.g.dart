// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volo_abp_localization_language_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VoloAbpLocalizationLanguageInfo
    extends VoloAbpLocalizationLanguageInfo {
  @override
  final String? cultureName;
  @override
  final String? uiCultureName;
  @override
  final String? displayName;
  @override
  final String? twoLetterISOLanguageName;

  factory _$VoloAbpLocalizationLanguageInfo(
          [void Function(VoloAbpLocalizationLanguageInfoBuilder)? updates]) =>
      (VoloAbpLocalizationLanguageInfoBuilder()..update(updates))._build();

  _$VoloAbpLocalizationLanguageInfo._(
      {this.cultureName,
      this.uiCultureName,
      this.displayName,
      this.twoLetterISOLanguageName})
      : super._();
  @override
  VoloAbpLocalizationLanguageInfo rebuild(
          void Function(VoloAbpLocalizationLanguageInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VoloAbpLocalizationLanguageInfoBuilder toBuilder() =>
      VoloAbpLocalizationLanguageInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VoloAbpLocalizationLanguageInfo &&
        cultureName == other.cultureName &&
        uiCultureName == other.uiCultureName &&
        displayName == other.displayName &&
        twoLetterISOLanguageName == other.twoLetterISOLanguageName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, cultureName.hashCode);
    _$hash = $jc(_$hash, uiCultureName.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, twoLetterISOLanguageName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VoloAbpLocalizationLanguageInfo')
          ..add('cultureName', cultureName)
          ..add('uiCultureName', uiCultureName)
          ..add('displayName', displayName)
          ..add('twoLetterISOLanguageName', twoLetterISOLanguageName))
        .toString();
  }
}

class VoloAbpLocalizationLanguageInfoBuilder
    implements
        Builder<VoloAbpLocalizationLanguageInfo,
            VoloAbpLocalizationLanguageInfoBuilder> {
  _$VoloAbpLocalizationLanguageInfo? _$v;

  String? _cultureName;
  String? get cultureName => _$this._cultureName;
  set cultureName(String? cultureName) => _$this._cultureName = cultureName;

  String? _uiCultureName;
  String? get uiCultureName => _$this._uiCultureName;
  set uiCultureName(String? uiCultureName) =>
      _$this._uiCultureName = uiCultureName;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _twoLetterISOLanguageName;
  String? get twoLetterISOLanguageName => _$this._twoLetterISOLanguageName;
  set twoLetterISOLanguageName(String? twoLetterISOLanguageName) =>
      _$this._twoLetterISOLanguageName = twoLetterISOLanguageName;

  VoloAbpLocalizationLanguageInfoBuilder() {
    VoloAbpLocalizationLanguageInfo._defaults(this);
  }

  VoloAbpLocalizationLanguageInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cultureName = $v.cultureName;
      _uiCultureName = $v.uiCultureName;
      _displayName = $v.displayName;
      _twoLetterISOLanguageName = $v.twoLetterISOLanguageName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VoloAbpLocalizationLanguageInfo other) {
    _$v = other as _$VoloAbpLocalizationLanguageInfo;
  }

  @override
  void update(void Function(VoloAbpLocalizationLanguageInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VoloAbpLocalizationLanguageInfo build() => _build();

  _$VoloAbpLocalizationLanguageInfo _build() {
    final _$result = _$v ??
        _$VoloAbpLocalizationLanguageInfo._(
          cultureName: cultureName,
          uiCultureName: uiCultureName,
          displayName: displayName,
          twoLetterISOLanguageName: twoLetterISOLanguageName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
