//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_admin_dtos_admin_page_user_vo.g.dart';

/// AiAdminServicesAdminDtosAdminPageUserVo
///
/// Properties:
/// * [userid] 
/// * [mobile] 
/// * [status] 
/// * [createDate] 
/// * [deviceCount] 
@BuiltValue()
abstract class AiAdminServicesAdminDtosAdminPageUserVo implements Built<AiAdminServicesAdminDtosAdminPageUserVo, AiAdminServicesAdminDtosAdminPageUserVoBuilder> {
  @BuiltValueField(wireName: r'userid')
  String? get userid;

  @BuiltValueField(wireName: r'mobile')
  String? get mobile;

  @BuiltValueField(wireName: r'status')
  int? get status;

  @BuiltValueField(wireName: r'createDate')
  String? get createDate;

  @BuiltValueField(wireName: r'deviceCount')
  String? get deviceCount;

  AiAdminServicesAdminDtosAdminPageUserVo._();

  factory AiAdminServicesAdminDtosAdminPageUserVo([void updates(AiAdminServicesAdminDtosAdminPageUserVoBuilder b)]) = _$AiAdminServicesAdminDtosAdminPageUserVo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesAdminDtosAdminPageUserVoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesAdminDtosAdminPageUserVo> get serializer => _$AiAdminServicesAdminDtosAdminPageUserVoSerializer();
}

class _$AiAdminServicesAdminDtosAdminPageUserVoSerializer implements PrimitiveSerializer<AiAdminServicesAdminDtosAdminPageUserVo> {
  @override
  final Iterable<Type> types = const [AiAdminServicesAdminDtosAdminPageUserVo, _$AiAdminServicesAdminDtosAdminPageUserVo];

  @override
  final String wireName = r'AiAdminServicesAdminDtosAdminPageUserVo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminPageUserVo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userid != null) {
      yield r'userid';
      yield serializers.serialize(
        object.userid,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.mobile != null) {
      yield r'mobile';
      yield serializers.serialize(
        object.mobile,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.createDate != null) {
      yield r'createDate';
      yield serializers.serialize(
        object.createDate,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.deviceCount != null) {
      yield r'deviceCount';
      yield serializers.serialize(
        object.deviceCount,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesAdminDtosAdminPageUserVo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesAdminDtosAdminPageUserVoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userid = valueDes;
          break;
        case r'mobile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.mobile = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'createDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.createDate = valueDes;
          break;
        case r'deviceCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesAdminDtosAdminPageUserVo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesAdminDtosAdminPageUserVoBuilder();
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

