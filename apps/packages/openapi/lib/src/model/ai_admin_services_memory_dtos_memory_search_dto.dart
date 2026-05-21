//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_dtos_memory_search_dto.g.dart';

/// AiAdminServicesMemoryDtosMemorySearchDto
///
/// Properties:
/// * [entityId] 
/// * [sessionId] 
/// * [query] 
/// * [recordType] 
/// * [maxResults] 
/// * [minScore] 
/// * [minImportance] 
/// * [includeExpired] 
@BuiltValue()
abstract class AiAdminServicesMemoryDtosMemorySearchDto implements Built<AiAdminServicesMemoryDtosMemorySearchDto, AiAdminServicesMemoryDtosMemorySearchDtoBuilder> {
  @BuiltValueField(wireName: r'entityId')
  String? get entityId;

  @BuiltValueField(wireName: r'sessionId')
  String? get sessionId;

  @BuiltValueField(wireName: r'query')
  String? get query;

  @BuiltValueField(wireName: r'recordType')
  String? get recordType;

  @BuiltValueField(wireName: r'maxResults')
  int? get maxResults;

  @BuiltValueField(wireName: r'minScore')
  double? get minScore;

  @BuiltValueField(wireName: r'minImportance')
  int? get minImportance;

  @BuiltValueField(wireName: r'includeExpired')
  int? get includeExpired;

  AiAdminServicesMemoryDtosMemorySearchDto._();

  factory AiAdminServicesMemoryDtosMemorySearchDto([void updates(AiAdminServicesMemoryDtosMemorySearchDtoBuilder b)]) = _$AiAdminServicesMemoryDtosMemorySearchDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesMemoryDtosMemorySearchDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesMemoryDtosMemorySearchDto> get serializer => _$AiAdminServicesMemoryDtosMemorySearchDtoSerializer();
}

class _$AiAdminServicesMemoryDtosMemorySearchDtoSerializer implements PrimitiveSerializer<AiAdminServicesMemoryDtosMemorySearchDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesMemoryDtosMemorySearchDto, _$AiAdminServicesMemoryDtosMemorySearchDto];

  @override
  final String wireName = r'AiAdminServicesMemoryDtosMemorySearchDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemorySearchDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.entityId != null) {
      yield r'entityId';
      yield serializers.serialize(
        object.entityId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.query != null) {
      yield r'query';
      yield serializers.serialize(
        object.query,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.recordType != null) {
      yield r'recordType';
      yield serializers.serialize(
        object.recordType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.maxResults != null) {
      yield r'maxResults';
      yield serializers.serialize(
        object.maxResults,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.minScore != null) {
      yield r'minScore';
      yield serializers.serialize(
        object.minScore,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.minImportance != null) {
      yield r'minImportance';
      yield serializers.serialize(
        object.minImportance,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.includeExpired != null) {
      yield r'includeExpired';
      yield serializers.serialize(
        object.includeExpired,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesMemoryDtosMemorySearchDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesMemoryDtosMemorySearchDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'entityId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.entityId = valueDes;
          break;
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'query':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.query = valueDes;
          break;
        case r'recordType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.recordType = valueDes;
          break;
        case r'maxResults':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.maxResults = valueDes;
          break;
        case r'minScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.minScore = valueDes;
          break;
        case r'minImportance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.minImportance = valueDes;
          break;
        case r'includeExpired':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.includeExpired = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesMemoryDtosMemorySearchDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesMemoryDtosMemorySearchDtoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

