// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_runtime_execution_dtos_llm_chat_message_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto
    extends AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto {
  @override
  final String? role;
  @override
  final String? content;
  @override
  final String? name;

  factory _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto(
          [void Function(
                  AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder)?
              updates]) =>
      (AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder()
            ..update(updates))
          ._build();

  _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto._(
      {this.role, this.content, this.name})
      : super._();
  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto rebuild(
          void Function(
                  AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder toBuilder() =>
      AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto &&
        role == other.role &&
        content == other.content &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto')
          ..add('role', role)
          ..add('content', content)
          ..add('name', name))
        .toString();
  }
}

class AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder
    implements
        Builder<AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto,
            AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder> {
  _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto? _$v;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder() {
    AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto._defaults(this);
  }

  AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _role = $v.role;
      _content = $v.content;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto other) {
    _$v = other as _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto;
  }

  @override
  void update(
      void Function(
              AiAdminServicesRuntimeExecutionDtosLlmChatMessageDtoBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto build() => _build();

  _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto _build() {
    final _$result = _$v ??
        _$AiAdminServicesRuntimeExecutionDtosLlmChatMessageDto._(
          role: role,
          content: content,
          name: name,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
