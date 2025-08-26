//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/simple_item_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'give_items_schema.g.dart';

/// GiveItemsSchema
///
/// Properties:
/// * [items] - List of items to give
/// * [character] - Character name. The name of the character who will receive the items.
@BuiltValue()
abstract class GiveItemsSchema
    implements Built<GiveItemsSchema, GiveItemsSchemaBuilder> {
  /// List of items to give
  @BuiltValueField(wireName: r'items')
  BuiltList<SimpleItemSchema> get items;

  /// Character name. The name of the character who will receive the items.
  @BuiltValueField(wireName: r'character')
  String get character;

  GiveItemsSchema._();

  factory GiveItemsSchema([void updates(GiveItemsSchemaBuilder b)]) =
      _$GiveItemsSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GiveItemsSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GiveItemsSchema> get serializer =>
      _$GiveItemsSchemaSerializer();
}

class _$GiveItemsSchemaSerializer
    implements PrimitiveSerializer<GiveItemsSchema> {
  @override
  final Iterable<Type> types = const [GiveItemsSchema, _$GiveItemsSchema];

  @override
  final String wireName = r'GiveItemsSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GiveItemsSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(SimpleItemSchema)]),
    );
    yield r'character';
    yield serializers.serialize(
      object.character,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GiveItemsSchema object, {
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
    required GiveItemsSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SimpleItemSchema)]),
          ) as BuiltList<SimpleItemSchema>;
          result.items.replace(valueDes);
          break;
        case r'character':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.character = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GiveItemsSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GiveItemsSchemaBuilder();
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
