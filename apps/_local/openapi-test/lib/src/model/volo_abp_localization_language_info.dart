//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'volo_abp_localization_language_info.g.dart';

/// VoloAbpLocalizationLanguageInfo
///
/// Properties:
/// * [cultureName] 
/// * [uiCultureName] 
/// * [displayName] 
/// * [twoLetterISOLanguageName] 
@BuiltValue()
abstract class VoloAbpLocalizationLanguageInfo implements Built<VoloAbpLocalizationLanguageInfo, VoloAbpLocalizationLanguageInfoBuilder> {
  @BuiltValueField(wireName: r'cultureName')
  String? get cultureName;

  @BuiltValueField(wireName: r'uiCultureName')
  String? get uiCultureName;

  @BuiltValueField(wireName: r'displayName')
  String? get displayName;

  @BuiltValueField(wireName: r'twoLetterISOLanguageName')
  String? get twoLetterISOLanguageName;

  VoloAbpLocalizationLanguageInfo._();

  factory VoloAbpLocalizationLanguageInfo([void updates(VoloAbpLocalizationLanguageInfoBuilder b)]) = _$VoloAbpLocalizationLanguageInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VoloAbpLocalizationLanguageInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VoloAbpLocalizationLanguageInfo> get serializer => _$VoloAbpLocalizationLanguageInfoSerializer();
}

class _$VoloAbpLocalizationLanguageInfoSerializer implements PrimitiveSerializer<VoloAbpLocalizationLanguageInfo> {
  @override
  final Iterable<Type> types = const [VoloAbpLocalizationLanguageInfo, _$VoloAbpLocalizationLanguageInfo];

  @override
  final String wireName = r'VoloAbpLocalizationLanguageInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VoloAbpLocalizationLanguageInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.cultureName != null) {
      yield r'cultureName';
      yield serializers.serialize(
        object.cultureName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.uiCultureName != null) {
      yield r'uiCultureName';
      yield serializers.serialize(
        object.uiCultureName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.displayName != null) {
      yield r'displayName';
      yield serializers.serialize(
        object.displayName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.twoLetterISOLanguageName != null) {
      yield r'twoLetterISOLanguageName';
      yield serializers.serialize(
        object.twoLetterISOLanguageName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VoloAbpLocalizationLanguageInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VoloAbpLocalizationLanguageInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cultureName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.cultureName = valueDes;
          break;
        case r'uiCultureName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.uiCultureName = valueDes;
          break;
        case r'displayName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.displayName = valueDes;
          break;
        case r'twoLetterISOLanguageName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.twoLetterISOLanguageName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VoloAbpLocalizationLanguageInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VoloAbpLocalizationLanguageInfoBuilder();
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

