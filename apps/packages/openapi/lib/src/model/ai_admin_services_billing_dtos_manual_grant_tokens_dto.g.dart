// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_billing_dtos_manual_grant_tokens_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesBillingDtosManualGrantTokensDto
    extends AiAdminServicesBillingDtosManualGrantTokensDto {
  @override
  final int? tokens;
  @override
  final String? remark;

  factory _$AiAdminServicesBillingDtosManualGrantTokensDto(
          [void Function(AiAdminServicesBillingDtosManualGrantTokensDtoBuilder)?
              updates]) =>
      (AiAdminServicesBillingDtosManualGrantTokensDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesBillingDtosManualGrantTokensDto._({this.tokens, this.remark})
      : super._();
  @override
  AiAdminServicesBillingDtosManualGrantTokensDto rebuild(
          void Function(AiAdminServicesBillingDtosManualGrantTokensDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesBillingDtosManualGrantTokensDtoBuilder toBuilder() =>
      AiAdminServicesBillingDtosManualGrantTokensDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesBillingDtosManualGrantTokensDto &&
        tokens == other.tokens &&
        remark == other.remark;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tokens.hashCode);
    _$hash = $jc(_$hash, remark.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesBillingDtosManualGrantTokensDto')
          ..add('tokens', tokens)
          ..add('remark', remark))
        .toString();
  }
}

class AiAdminServicesBillingDtosManualGrantTokensDtoBuilder
    implements
        Builder<AiAdminServicesBillingDtosManualGrantTokensDto,
            AiAdminServicesBillingDtosManualGrantTokensDtoBuilder> {
  _$AiAdminServicesBillingDtosManualGrantTokensDto? _$v;

  int? _tokens;
  int? get tokens => _$this._tokens;
  set tokens(int? tokens) => _$this._tokens = tokens;

  String? _remark;
  String? get remark => _$this._remark;
  set remark(String? remark) => _$this._remark = remark;

  AiAdminServicesBillingDtosManualGrantTokensDtoBuilder() {
    AiAdminServicesBillingDtosManualGrantTokensDto._defaults(this);
  }

  AiAdminServicesBillingDtosManualGrantTokensDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tokens = $v.tokens;
      _remark = $v.remark;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesBillingDtosManualGrantTokensDto other) {
    _$v = other as _$AiAdminServicesBillingDtosManualGrantTokensDto;
  }

  @override
  void update(
      void Function(AiAdminServicesBillingDtosManualGrantTokensDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesBillingDtosManualGrantTokensDto build() => _build();

  _$AiAdminServicesBillingDtosManualGrantTokensDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesBillingDtosManualGrantTokensDto._(
          tokens: tokens,
          remark: remark,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
