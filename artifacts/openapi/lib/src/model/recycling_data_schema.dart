//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/recycling_items_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recycling_data_schema.g.dart';

/// RecyclingDataSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [details] - Craft details.
/// * [character] - Player details.
@BuiltValue()
abstract class RecyclingDataSchema
    implements Built<RecyclingDataSchema, RecyclingDataSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Craft details.
  @BuiltValueField(wireName: r'details')
  RecyclingItemsSchema get details;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  RecyclingDataSchema._();

  factory RecyclingDataSchema([void updates(RecyclingDataSchemaBuilder b)]) =
      _$RecyclingDataSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecyclingDataSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecyclingDataSchema> get serializer =>
      _$RecyclingDataSchemaSerializer();
}

class _$RecyclingDataSchemaSerializer
    implements PrimitiveSerializer<RecyclingDataSchema> {
  @override
  final Iterable<Type> types = const [
    RecyclingDataSchema,
    _$RecyclingDataSchema
  ];

  @override
  final String wireName = r'RecyclingDataSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecyclingDataSchema object, {
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
      specifiedType: const FullType(RecyclingItemsSchema),
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
    RecyclingDataSchema object, {
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
    required RecyclingDataSchemaBuilder result,
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
            specifiedType: const FullType(RecyclingItemsSchema),
          ) as RecyclingItemsSchema;
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
  RecyclingDataSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecyclingDataSchemaBuilder();
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
