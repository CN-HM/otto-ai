//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_voice_dtos_ota_entity_dto.g.dart';

/// AiAdminServicesVoiceDtosOtaEntityDto
///
/// Properties:
/// * [id] 
/// * [firmwareName] 
/// * [type] 
/// * [version] 
/// * [size] 
/// * [remark] 
/// * [firmwarePath] 
/// * [sort] 
/// * [creator] 
/// * [createDate] 
/// * [updater] 
/// * [updateDate] 
@BuiltValue()
abstract class AiAdminServicesVoiceDtosOtaEntityDto implements Built<AiAdminServicesVoiceDtosOtaEntityDto, AiAdminServicesVoiceDtosOtaEntityDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'firmwareName')
  String? get firmwareName;

  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'version')
  String? get version;

  @BuiltValueField(wireName: r'size')
  int? get size;

  @BuiltValueField(wireName: r'remark')
  String? get remark;

  @BuiltValueField(wireName: r'firmwarePath')
  String? get firmwarePath;

  @BuiltValueField(wireName: r'sort')
  int? get sort;

  @BuiltValueField(wireName: r'creator')
  int? get creator;

  @BuiltValueField(wireName: r'createDate')
  String? get createDate;

  @BuiltValueField(wireName: r'updater')
  int? get updater;

  @BuiltValueField(wireName: r'updateDate')
  String? get updateDate;

  AiAdminServicesVoiceDtosOtaEntityDto._();

  factory AiAdminServicesVoiceDtosOtaEntityDto([void updates(AiAdminServicesVoiceDtosOtaEntityDtoBuilder b)]) = _$AiAdminServicesVoiceDtosOtaEntityDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiAdminServicesVoiceDtosOtaEntityDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiAdminServicesVoiceDtosOtaEntityDto> get serializer => _$AiAdminServicesVoiceDtosOtaEntityDtoSerializer();
}

class _$AiAdminServicesVoiceDtosOtaEntityDtoSerializer implements PrimitiveSerializer<AiAdminServicesVoiceDtosOtaEntityDto> {
  @override
  final Iterable<Type> types = const [AiAdminServicesVoiceDtosOtaEntityDto, _$AiAdminServicesVoiceDtosOtaEntityDto];

  @override
  final String wireName = r'AiAdminServicesVoiceDtosOtaEntityDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiAdminServicesVoiceDtosOtaEntityDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.firmwareName != null) {
      yield r'firmwareName';
      yield serializers.serialize(
        object.firmwareName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.version != null) {
      yield r'version';
      yield serializers.serialize(
        object.version,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.size != null) {
      yield r'size';
      yield serializers.serialize(
        object.size,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.remark != null) {
      yield r'remark';
      yield serializers.serialize(
        object.remark,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.firmwarePath != null) {
      yield r'firmwarePath';
      yield serializers.serialize(
        object.firmwarePath,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sort != null) {
      yield r'sort';
      yield serializers.serialize(
        object.sort,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.creator != null) {
      yield r'creator';
      yield serializers.serialize(
        object.creator,
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
    if (object.updater != null) {
      yield r'updater';
      yield serializers.serialize(
        object.updater,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.updateDate != null) {
      yield r'updateDate';
      yield serializers.serialize(
        object.updateDate,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AiAdminServicesVoiceDtosOtaEntityDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiAdminServicesVoiceDtosOtaEntityDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'firmwareName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.firmwareName = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.type = valueDes;
          break;
        case r'version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.version = valueDes;
          break;
        case r'size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.size = valueDes;
          break;
        case r'remark':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.remark = valueDes;
          break;
        case r'firmwarePath':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.firmwarePath = valueDes;
          break;
        case r'sort':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sort = valueDes;
          break;
        case r'creator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.creator = valueDes;
          break;
        case r'createDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.createDate = valueDes;
          break;
        case r'updater':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.updater = valueDes;
          break;
        case r'updateDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.updateDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AiAdminServicesVoiceDtosOtaEntityDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiAdminServicesVoiceDtosOtaEntityDtoBuilder();
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

