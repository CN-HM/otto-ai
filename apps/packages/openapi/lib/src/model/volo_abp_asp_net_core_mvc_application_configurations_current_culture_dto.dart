//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_date_time_format_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_asp_net_core_mvc_application_configurations_current_culture_dto.g.dart';

/// VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto
///
/// Properties:
/// * [displayName] 
/// * [englishName] 
/// * [threeLetterIsoLanguageName] 
/// * [twoLetterIsoLanguageName] 
/// * [isRightToLeft] 
/// * [cultureName] 
/// * [name] 
/// * [nativeName] 
/// * [dateTimeFormat] 
@BuiltValue()
abstract class VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto implements Built<VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto, VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder> {
  @BuiltValueField(wireName: r'displayName')
  String? get displayName;

  @BuiltValueField(wireName: r'englishName')
  String? get englishName;

  @BuiltValueField(wireName: r'threeLetterIsoLanguageName')
  String? get threeLetterIsoLanguageName;

  @BuiltValueField(wireName: r'twoLetterIsoLanguageName')
  String? get twoLetterIsoLanguageName;

  @BuiltValueField(wireName: r'isRightToLeft')
  bool? get isRightToLeft;

  @BuiltValueField(wireName: r'cultureName')
  String? get cultureName;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'nativeName')
  String? get nativeName;

  @BuiltValueField(wireName: r'dateTimeFormat')
  VoloAbpAspNetCoreMvcApplicationConfigurationsDateTimeFormatDto? get dateTimeFormat;

  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto._();

  factory VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto([void updates(VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder b)]) = _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto> get serializer => _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoSerializer();
}

class _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoSerializer implements PrimitiveSerializer<VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto> {
  @override
  final Iterable<Type> types = const [VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto, _$VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto];

  @override
  final String wireName = r'VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.displayName != null) {
      yield r'displayName';
      yield serializers.serialize(
        object.displayName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.englishName != null) {
      yield r'englishName';
      yield serializers.serialize(
        object.englishName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.threeLetterIsoLanguageName != null) {
      yield r'threeLetterIsoLanguageName';
      yield serializers.serialize(
        object.threeLetterIsoLanguageName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.twoLetterIsoLanguageName != null) {
      yield r'twoLetterIsoLanguageName';
      yield serializers.serialize(
        object.twoLetterIsoLanguageName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isRightToLeft != null) {
      yield r'isRightToLeft';
      yield serializers.serialize(
        object.isRightToLeft,
        specifiedType: const FullType(bool),
      );
    }
    if (object.cultureName != null) {
      yield r'cultureName';
      yield serializers.serialize(
        object.cultureName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.nativeName != null) {
      yield r'nativeName';
      yield serializers.serialize(
        object.nativeName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.dateTimeFormat != null) {
      yield r'dateTimeFormat';
      yield serializers.serialize(
        object.dateTimeFormat,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsDateTimeFormatDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'displayName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.displayName = valueDes;
          break;
        case r'englishName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.englishName = valueDes;
          break;
        case r'threeLetterIsoLanguageName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.threeLetterIsoLanguageName = valueDes;
          break;
        case r'twoLetterIsoLanguageName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.twoLetterIsoLanguageName = valueDes;
          break;
        case r'isRightToLeft':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isRightToLeft = valueDes;
          break;
        case r'cultureName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.cultureName = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'nativeName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nativeName = valueDes;
          break;
        case r'dateTimeFormat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsDateTimeFormatDto),
          ) as VoloAbpAspNetCoreMvcApplicationConfigurationsDateTimeFormatDto;
          result.dateTimeFormat.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpAspNetCoreMvcApplicationConfigurationsCurrentCultureDtoBuilder();
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

