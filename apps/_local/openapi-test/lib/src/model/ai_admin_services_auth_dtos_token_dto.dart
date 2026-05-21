//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_auth_dtos_token_dto.g.dart';

/// AiAdminServicesAuthDtosTokenDto
///
/// Properties:
/// * [token] 
/// * [expire] 
/// * [clientHash] 
@BuiltValue()
abstract class AiAdminServicesAuthDtosTokenDto implements Built<AiAdminServicesAuthDtosTokenDto, AiAdminServicesAuthDtosTokenDtoBuilder> {
  @BuiltValueField(wireName: r'token')
  String? get token;

  @BuiltValueField(wireName: r'expire')
  int? get expire;

  @BuiltValueField(wireName: r'clientHash')
  String? get clientHash;

  AiAdminServicesAuthDtosTokenDto._();

  factory AiAdminServicesAuthDtosTokenDto([void updates(AiAdminServicesAuthDtosTokenDtoBuilder b)]) = _$AiAdminServicesAuthDtosTokenDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAuthDtosTokenDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAuthDtosTokenDto> get serializer => _$AiAdminServicesAuthDtosTokenDtoSerializer();
}

class _$AiAdminServicesAuthDtosTokenDtoSerializer implements PrimitiveSerializer<AiAdminServicesAuthDtosTokenDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAuthDtosTokenDto, _$AiAdminServicesAuthDtosTokenDto];

  @override
  final String wireName = r'AiAdminServicesAuthDtosTokenDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAuthDtosTokenDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.token != null) {
      yield r'token';
      yield serializers.serialize(
        object.token,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.expire != null) {
      yield r'expire';
      yield serializers.serialize(
        object.expire,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.clientHash != null) {
      yield r'clientHash';
      yield serializers.serialize(
        object.clientHash,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAuthDtosTokenDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAuthDtosTokenDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.token = valueDes;
          break;
        case r'expire':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.expire = valueDes;
          break;
        case r'clientHash':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.clientHash = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAuthDtosTokenDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAuthDtosTokenDtoBuilder();
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

