//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'give_gold_schema.g.dart';

/// GiveGoldSchema
///
/// Properties:
/// * [quantity] - Gold quantity.
/// * [character] - Character name. The name of the character who will receive the gold.
@BuiltValue()
abstract class GiveGoldSchema
    implements Built<GiveGoldSchema, GiveGoldSchemaBuilder> {
  /// Gold quantity.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  /// Character name. The name of the character who will receive the gold.
  @BuiltValueField(wireName: r'character')
  String get character;

  GiveGoldSchema._();

  factory GiveGoldSchema([void updates(GiveGoldSchemaBuilder b)]) =
      _$GiveGoldSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GiveGoldSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GiveGoldSchema> get serializer =>
      _$GiveGoldSchemaSerializer();
}

class _$GiveGoldSchemaSerializer
    implements PrimitiveSerializer<GiveGoldSchema> {
  @override
  final Iterable<Type> types = const [GiveGoldSchema, _$GiveGoldSchema];

  @override
  final String wireName = r'GiveGoldSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GiveGoldSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(int),
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
    GiveGoldSchema object, {
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
    required GiveGoldSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.quantity = valueDes;
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
  GiveGoldSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GiveGoldSchemaBuilder();
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
