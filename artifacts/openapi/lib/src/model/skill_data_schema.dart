//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:artifacts_api/src/model/skill_info_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'skill_data_schema.g.dart';

/// SkillDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [details] - Craft details.
/// * [character] - Player details.
@BuiltValue()
abstract class SkillDataSchema
    implements Built<SkillDataSchema, SkillDataSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Craft details.
  @BuiltValueField(wireName: r'details')
  SkillInfoSchema get details;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  SkillDataSchema._();

  factory SkillDataSchema([void updates(SkillDataSchemaBuilder b)]) =
      _$SkillDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SkillDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SkillDataSchema> get serializer =>
      _$SkillDataSchemaSerializer();
}

class _$SkillDataSchemaSerializer
    implements PrimitiveSerializer<SkillDataSchema> {
  @override
  final Iterable<Type> types = const [SkillDataSchema, _$SkillDataSchema];

  @override
  final String wireName = r'SkillDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SkillDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'details';
    yield serializers.serialize(
      object.details,
      specifiedType: const FullType(SkillInfoSchema),
    );
    yield r'character';
    yield serializers.serialize(
      object.character,
      specifiedType: const FullType(CharacterSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SkillDataSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SkillDataSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'cooldown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CooldownSchema),
          ) as CooldownSchema;
          result.cooldown.replace(valueDes);
          break;
        case r'details':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SkillInfoSchema),
          ) as SkillInfoSchema;
          result.details.replace(valueDes);
          break;
        case r'character':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CharacterSchema),
          ) as CharacterSchema;
          result.character.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SkillDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SkillDataSchemaBuilder();
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
