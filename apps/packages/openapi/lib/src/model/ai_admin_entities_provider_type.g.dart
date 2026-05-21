// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_admin_entities_provider_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AiAdminEntitiesProviderType _$ark =
    const AiAdminEntitiesProviderType._('ark');
const AiAdminEntitiesProviderType _$doubaoSpeech =
    const AiAdminEntitiesProviderType._('doubaoSpeech');
const AiAdminEntitiesProviderType _$dashScope =
    const AiAdminEntitiesProviderType._('dashScope');

AiAdminEntitiesProviderType _$valueOf(String name) {
  switch (name) {
    case 'ark':
      return _$ark;
    case 'doubaoSpeech':
      return _$doubaoSpeech;
    case 'dashScope':
      return _$dashScope;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AiAdminEntitiesProviderType> _$values =
    BuiltSet<AiAdminEntitiesProviderType>(const <AiAdminEntitiesProviderType>[
  _$ark,
  _$doubaoSpeech,
  _$dashScope,
]);

class _$AiAdminEntitiesProviderTypeMeta {
  const _$AiAdminEntitiesProviderTypeMeta();
  AiAdminEntitiesProviderType get ark => _$ark;
  AiAdminEntitiesProviderType get doubaoSpeech => _$doubaoSpeech;
  AiAdminEntitiesProviderType get dashScope => _$dashScope;
  AiAdminEntitiesProviderType valueOf(String name) => _$valueOf(name);
  BuiltSet<AiAdminEntitiesProviderType> get values => _$values;
}

abstract class _$AiAdminEntitiesProviderTypeMixin {
  // ignore: non_constant_identifier_names
  _$AiAdminEntitiesProviderTypeMeta get AiAdminEntitiesProviderType =>
      const _$AiAdminEntitiesProviderTypeMeta();
}

Serializer<AiAdminEntitiesProviderType>
    _$aiAdminEntitiesProviderTypeSerializer =
    _$AiAdminEntitiesProviderTypeSerializer();

class _$AiAdminEntitiesProviderTypeSerializer
    implements PrimitiveSerializer<AiAdminEntitiesProviderType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ark': 'Ark',
    'doubaoSpeech': 'DoubaoSpeech',
    'dashScope': 'DashScope',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Ark': 'ark',
    'DoubaoSpeech': 'doubaoSpeech',
    'DashScope': 'dashScope',
  };

  @override
  final Iterable<Type> types = const <Type>[AiAdminEntitiesProviderType];
  @override
  final String wireName = 'AiAdminEntitiesProviderType';

  @override
  Object serialize(Serializers serializers, AiAdminEntitiesProviderType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AiAdminEntitiesProviderType deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AiAdminEntitiesProviderType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
