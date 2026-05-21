//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_remote_service_validation_error_info.g.dart';

/// VoloAbpHttpRemoteServiceValidationErrorInfo
///
/// Properties:
/// * [message] 
/// * [members] 
@BuiltValue()
abstract class VoloAbpHttpRemoteServiceValidationErrorInfo implements Built<VoloAbpHttpRemoteServiceValidationErrorInfo, VoloAbpHttpRemoteServiceValidationErrorInfoBuilder> {
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'members')
  BuiltList<String>? get members;

  VoloAbpHttpRemoteServiceValidationErrorInfo._();

  factory VoloAbpHttpRemoteServiceValidationErrorInfo([void updates(VoloAbpHttpRemoteServiceValidationErrorInfoBuilder b)]) = _$VoloAbpHttpRemoteServiceValidationErrorInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpRemoteServiceValidationErrorInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpRemoteServiceValidationErrorInfo> get serializer => _$VoloAbpHttpRemoteServiceValidationErrorInfoSerializer();
}

class _$VoloAbpHttpRemoteServiceValidationErrorInfoSerializer implements PrimitiveSerializer<VoloAbpHttpRemoteServiceValidationErrorInfo> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpRemoteServiceValidationErrorInfo, _$VoloAbpHttpRemoteServiceValidationErrorInfo];

  @override
  final String wireName = r'VoloAbpHttpRemoteServiceValidationErrorInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpRemoteServiceValidationErrorInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.members != null) {
      yield r'members';
      yield serializers.serialize(
        object.members,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpRemoteServiceValidationErrorInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpRemoteServiceValidationErrorInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        case r'members':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.members.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpRemoteServiceValidationErrorInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpRemoteServiceValidationErrorInfoBuilder();
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

