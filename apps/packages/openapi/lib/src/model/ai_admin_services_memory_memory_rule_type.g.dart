// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_services_memory_memory_rule_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AiAdminServicesMemoryMemoryRuleType _$profile =
    const AiAdminServicesMemoryMemoryRuleType._('profile');
const AiAdminServicesMemoryMemoryRuleType _$node =
    const AiAdminServicesMemoryMemoryRuleType._('node');
const AiAdminServicesMemoryMemoryRuleType _$risk =
    const AiAdminServicesMemoryMemoryRuleType._('risk');
const AiAdminServicesMemoryMemoryRuleType _$healthFollowup =
    const AiAdminServicesMemoryMemoryRuleType._('healthFollowup');
const AiAdminServicesMemoryMemoryRuleType _$todo =
    const AiAdminServicesMemoryMemoryRuleType._('todo');
const AiAdminServicesMemoryMemoryRuleType _$reminder =
    const AiAdminServicesMemoryMemoryRuleType._('reminder');

AiAdminServicesMemoryMemoryRuleType _$valueOf(String name) {
  switch (name) {
    case 'profile':
      return _$profile;
    case 'node':
      return _$node;
    case 'risk':
      return _$risk;
    case 'healthFollowup':
      return _$healthFollowup;
    case 'todo':
      return _$todo;
    case 'reminder':
      return _$reminder;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AiAdminServicesMemoryMemoryRuleType> _$values = BuiltSet<
    AiAdminServicesMemoryMemoryRuleType>(const <AiAdminServicesMemoryMemoryRuleType>[
  _$profile,
  _$node,
  _$risk,
  _$healthFollowup,
  _$todo,
  _$reminder,
]);

class _$AiAdminServicesMemoryMemoryRuleTypeMeta {
  const _$AiAdminServicesMemoryMemoryRuleTypeMeta();
  AiAdminServicesMemoryMemoryRuleType get profile => _$profile;
  AiAdminServicesMemoryMemoryRuleType get node => _$node;
  AiAdminServicesMemoryMemoryRuleType get risk => _$risk;
  AiAdminServicesMemoryMemoryRuleType get healthFollowup => _$healthFollowup;
  AiAdminServicesMemoryMemoryRuleType get todo => _$todo;
  AiAdminServicesMemoryMemoryRuleType get reminder => _$reminder;
  AiAdminServicesMemoryMemoryRuleType valueOf(String name) => _$valueOf(name);
  BuiltSet<AiAdminServicesMemoryMemoryRuleType> get values => _$values;
}

abstract class _$AiAdminServicesMemoryMemoryRuleTypeMixin {
  // ignore: non_constant_identifier_names
  _$AiAdminServicesMemoryMemoryRuleTypeMeta
      get AiAdminServicesMemoryMemoryRuleType =>
          const _$AiAdminServicesMemoryMemoryRuleTypeMeta();
}

Serializer<AiAdminServicesMemoryMemoryRuleType>
    _$aiAdminServicesMemoryMemoryRuleTypeSerializer =
    _$AiAdminServicesMemoryMemoryRuleTypeSerializer();

class _$AiAdminServicesMemoryMemoryRuleTypeSerializer
    implements PrimitiveSerializer<AiAdminServicesMemoryMemoryRuleType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'profile': 'profile',
    'node': 'node',
    'risk': 'risk',
    'healthFollowup': 'health_followup',
    'todo': 'todo',
    'reminder': 'reminder',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'profile': 'profile',
    'node': 'node',
    'risk': 'risk',
    'health_followup': 'healthFollowup',
    'todo': 'todo',
    'reminder': 'reminder',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AiAdminServicesMemoryMemoryRuleType
  ];
  @override
  final String wireName = 'AiAdminServicesMemoryMemoryRuleType';

  @override
  Object serialize(
          Serializers serializers, AiAdminServicesMemoryMemoryRuleType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AiAdminServicesMemoryMemoryRuleType deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AiAdminServicesMemoryMemoryRuleType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
