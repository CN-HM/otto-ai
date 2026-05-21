//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_billing_dtos_manual_grant_tokens_dto.g.dart';

/// AiAdminServicesBillingDtosManualGrantTokensDto
///
/// Properties:
/// * [tokens] 
/// * [remark] 
@BuiltValue()
abstract class AiAdminServicesBillingDtosManualGrantTokensDto implements Built<AiAdminServicesBillingDtosManualGrantTokensDto, AiAdminServicesBillingDtosManualGrantTokensDtoBuilder> {
  @BuiltValueField(wireName: r'tokens')
  int? get tokens;

  @BuiltValueField(wireName: r'remark')
  String? get remark;

  AiAdminServicesBillingDtosManualGrantTokensDto._();

  factory AiAdminServicesBillingDtosManualGrantTokensDto([void updates(AiAdminServicesBillingDtosManualGrantTokensDtoBuilder b)]) = _$AiAdminServicesBillingDtosManualGrantTokensDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesBillingDtosManualGrantTokensDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesBillingDtosManualGrantTokensDto> get serializer => _$AiAdminServicesBillingDtosManualGrantTokensDtoSerializer();
}

class _$AiAdminServicesBillingDtosManualGrantTokensDtoSerializer implements PrimitiveSerializer<AiAdminServicesBillingDtosManualGrantTokensDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesBillingDtosManualGrantTokensDto, _$AiAdminServicesBillingDtosManualGrantTokensDto];

  @override
  final String wireName = r'AiAdminServicesBillingDtosManualGrantTokensDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesBillingDtosManualGrantTokensDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.tokens != null) {
      yield r'tokens';
      yield serializers.serialize(
        object.tokens,
        specifiedType: const FullType(int),
      );
    }
    if (object.remark != null) {
      yield r'remark';
      yield serializers.serialize(
        object.remark,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesBillingDtosManualGrantTokensDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesBillingDtosManualGrantTokensDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'tokens':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.tokens = valueDes;
          break;
        case r'remark':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.remark = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesBillingDtosManualGrantTokensDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesBillingDtosManualGrantTokensDtoBuilder();
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

