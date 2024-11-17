//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/simple_item_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_item_schema.g.dart';

/// DeleteItemSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [item] - Item details.
/// * [character] - Player details.
@BuiltValue()
abstract class DeleteItemSchema
    implements Built<DeleteItemSchema, DeleteItemSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Item details.
  @BuiltValueField(wireName: r'item')
  SimpleItemSchema get item;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  DeleteItemSchema._();

  factory DeleteItemSchema([void updates(DeleteItemSchemaBuilder b)]) =
      _$DeleteItemSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteItemSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteItemSchema> get serializer =>
      _$DeleteItemSchemaSerializer();
}

class _$DeleteItemSchemaSerializer
    implements PrimitiveSerializer<DeleteItemSchema> {
  @override
  final Iterable<Type> types = const [DeleteItemSchema, _$DeleteItemSchema];

  @override
  final String wireName = r'DeleteItemSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteItemSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'item';
    yield serializers.serialize(
      object.item,
      specifiedType: const FullType(SimpleItemSchema),
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
    DeleteItemSchema object, {
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
    required DeleteItemSchemaBuilder result,
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
        case r'item':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SimpleItemSchema),
          ) as SimpleItemSchema;
          result.item.replace(valueDes);
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
  DeleteItemSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteItemSchemaBuilder();
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
