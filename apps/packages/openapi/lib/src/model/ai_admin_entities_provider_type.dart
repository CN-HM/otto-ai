//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_entities_provider_type.g.dart';

class AiAdminEntitiesProviderType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Ark')
  static const AiAdminEntitiesProviderType ark = _$ark;
  @BuiltValueEnumConst(wireName: r'DoubaoSpeech')
  static const AiAdminEntitiesProviderType doubaoSpeech = _$doubaoSpeech;
  @BuiltValueEnumConst(wireName: r'DashScope')
  static const AiAdminEntitiesProviderType dashScope = _$dashScope;

  static Serializer<AiAdminEntitiesProviderType> get serializer => _$aiAdminEntitiesProviderTypeSerializer;

  const AiAdminEntitiesProviderType._(String name): super(name);

  static BuiltSet<AiAdminEntitiesProviderType> get values => _$values;
  static AiAdminEntitiesProviderType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AiAdminEntitiesProviderTypeMixin = Object with _$AiAdminEntitiesProviderTypeMixin;

