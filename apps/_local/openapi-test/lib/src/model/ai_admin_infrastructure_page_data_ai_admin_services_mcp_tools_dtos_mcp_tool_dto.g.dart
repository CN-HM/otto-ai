// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_infrastructure_page_data_ai_admin_services_mcp_tools_dtos_mcp_tool_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto
    extends AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto {
  @override
  final int? total;
  @override
  final BuiltList<AiAdminServicesMcpToolsDtosMcpToolDto>? list;

  factory _$AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto(
          [void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDtoBuilder)?
              updates]) =>
      (AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto._(
      {this.total, this.list})
      : super._();
  @override
  AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto rebuild(
          void Function(
                  AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDtoBuilder
      toBuilder() =>
          AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDtoBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto &&
        total == other.total &&
        list == other.list;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto')
          ..add('total', total)
          ..add('list', list))
        .toString();
  }
}

class AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDtoBuilder
    implements
        Builder<
            AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto,
            AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDtoBuilder> {
  _$AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  ListBuilder<AiAdminServicesMcpToolsDtosMcpToolDto>? _list;
  ListBuilder<AiAdminServicesMcpToolsDtosMcpToolDto> get list =>
      _$this._list ??= ListBuilder<AiAdminServicesMcpToolsDtosMcpToolDto>();
  set list(ListBuilder<AiAdminServicesMcpToolsDtosMcpToolDto>? list) =>
      _$this._list = list;

  AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDtoBuilder() {
    AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto
        ._defaults(this);
  }

  AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDtoBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _list = $v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto
          other) {
    _$v = other
        as _$AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto;
  }

  @override
  void update(
      void Function(
              AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto build() =>
      _build();

  _$AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto
      _build() {
    _$AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto
        _$result;
    try {
      _$result = _$v ??
          _$AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto
              ._(
            total: total,
            list: _list?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'list';
        _list?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
