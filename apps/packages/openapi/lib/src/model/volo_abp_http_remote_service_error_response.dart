//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_http_remote_service_error_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_http_remote_service_error_response.g.dart';

/// VoloAbpHttpRemoteServiceErrorResponse
///
/// Properties:
/// * [error] 
@BuiltValue()
abstract class VoloAbpHttpRemoteServiceErrorResponse implements Built<VoloAbpHttpRemoteServiceErrorResponse, VoloAbpHttpRemoteServiceErrorResponseBuilder> {
  @BuiltValueField(wireName: r'error')
  VoloAbpHttpRemoteServiceErrorInfo? get error;

  VoloAbpHttpRemoteServiceErrorResponse._();

  factory VoloAbpHttpRemoteServiceErrorResponse([void updates(VoloAbpHttpRemoteServiceErrorResponseBuilder b)]) = _$VoloAbpHttpRemoteServiceErrorResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpHttpRemoteServiceErrorResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpHttpRemoteServiceErrorResponse> get serializer => _$VoloAbpHttpRemoteServiceErrorResponseSerializer();
}

class _$VoloAbpHttpRemoteServiceErrorResponseSerializer implements PrimitiveSerializer<VoloAbpHttpRemoteServiceErrorResponse> {
  @override
  final Iterable<Type> types = const [VoloAbpHttpRemoteServiceErrorResponse, _$VoloAbpHttpRemoteServiceErrorResponse];

  @override
  final String wireName = r'VoloAbpHttpRemoteServiceErrorResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpHttpRemoteServiceErrorResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType(VoloAbpHttpRemoteServiceErrorInfo),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpHttpRemoteServiceErrorResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpHttpRemoteServiceErrorResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpHttpRemoteServiceErrorInfo),
          ) as VoloAbpHttpRemoteServiceErrorInfo;
          result.error.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpHttpRemoteServiceErrorResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpHttpRemoteServiceErrorResponseBuilder();
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

