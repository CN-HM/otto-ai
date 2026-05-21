// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_agent_roles_dtos_option_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesAgentRolesDtosOptionItemDto
    extends AiAdminServicesAgentRolesDtosOptionItemDto {
  @override
  final String? label;
  @override
  final String? value;
  @override
  final String? description;

  factory _$AiAdminServicesAgentRolesDtosOptionItemDto(
          [void Function(AiAdminServicesAgentRolesDtosOptionItemDtoBuilder)?
              updates]) =>
      (AiAdminServicesAgentRolesDtosOptionItemDtoBuilder()..update(updates))
          ._build();

  _$AiAdminServicesAgentRolesDtosOptionItemDto._(
      {this.label, this.value, this.description})
      : super._();
  @override
  AiAdminServicesAgentRolesDtosOptionItemDto rebuild(
          void Function(AiAdminServicesAgentRolesDtosOptionItemDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesAgentRolesDtosOptionItemDtoBuilder toBuilder() =>
      AiAdminServicesAgentRolesDtosOptionItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesAgentRolesDtosOptionItemDto &&
        label == other.label &&
        value == other.value &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesAgentRolesDtosOptionItemDto')
          ..add('label', label)
          ..add('value', value)
          ..add('description', description))
        .toString();
  }
}

class AiAdminServicesAgentRolesDtosOptionItemDtoBuilder
    implements
        Builder<AiAdminServicesAgentRolesDtosOptionItemDto,
            AiAdminServicesAgentRolesDtosOptionItemDtoBuilder> {
  _$AiAdminServicesAgentRolesDtosOptionItemDto? _$v;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  AiAdminServicesAgentRolesDtosOptionItemDtoBuilder() {
    AiAdminServicesAgentRolesDtosOptionItemDto._defaults(this);
  }

  AiAdminServicesAgentRolesDtosOptionItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _label = $v.label;
      _value = $v.value;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesAgentRolesDtosOptionItemDto other) {
    _$v = other as _$AiAdminServicesAgentRolesDtosOptionItemDto;
  }

  @override
  void update(
      void Function(AiAdminServicesAgentRolesDtosOptionItemDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesAgentRolesDtosOptionItemDto build() => _build();

  _$AiAdminServicesAgentRolesDtosOptionItemDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesAgentRolesDtosOptionItemDto._(
          label: label,
          value: value,
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
