//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_admin_services_memory_memory_rule_type.g.dart';

class AiAdminServicesMemoryMemoryRuleType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'profile')
  static const AiAdminServicesMemoryMemoryRuleType profile = _$profile;
  @BuiltValueEnumConst(wireName: r'node')
  static const AiAdminServicesMemoryMemoryRuleType node = _$node;
  @BuiltValueEnumConst(wireName: r'risk')
  static const AiAdminServicesMemoryMemoryRuleType risk = _$risk;
  @BuiltValueEnumConst(wireName: r'health_followup')
  static const AiAdminServicesMemoryMemoryRuleType healthFollowup = _$healthFollowup;
  @BuiltValueEnumConst(wireName: r'todo')
  static const AiAdminServicesMemoryMemoryRuleType todo = _$todo;
  @BuiltValueEnumConst(wireName: r'reminder')
  static const AiAdminServicesMemoryMemoryRuleType reminder = _$reminder;

  static Serializer<AiAdminServicesMemoryMemoryRuleType> get serializer => _$aiAdminServicesMemoryMemoryRuleTypeSerializer;

  const AiAdminServicesMemoryMemoryRuleType._(String name): super(name);

  static BuiltSet<AiAdminServicesMemoryMemoryRuleType> get values => _$values;
  static AiAdminServicesMemoryMemoryRuleType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AiAdminServicesMemoryMemoryRuleTypeMixin = Object with _$AiAdminServicesMemoryMemoryRuleTypeMixin;

