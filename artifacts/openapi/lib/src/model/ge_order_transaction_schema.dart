//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/ge_order_created_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_order_transaction_schema.g.dart';

/// GEOrderTransactionSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [order] - Order details.
/// * [character] - Character details.
@BuiltValue()
abstract class GEOrderTransactionSchema
    implements
        Built<GEOrderTransactionSchema, GEOrderTransactionSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Order details.
  @BuiltValueField(wireName: r'order')
  GEOrderCreatedSchema get order;

  /// Character details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  GEOrderTransactionSchema._();

  factory GEOrderTransactionSchema(
          [void updates(GEOrderTransactionSchemaBuilder b)]) =
      _$GEOrderTransactionSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GEOrderTransactionSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GEOrderTransactionSchema> get serializer =>
      _$GEOrderTransactionSchemaSerializer();
}

class _$GEOrderTransactionSchemaSerializer
    implements PrimitiveSerializer<GEOrderTransactionSchema> {
  @override
  final Iterable<Type> types = const [
    GEOrderTransactionSchema,
    _$GEOrderTransactionSchema
  ];

  @override
  final String wireName = r'GEOrderTransactionSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GEOrderTransactionSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'order';
    yield serializers.serialize(
      object.order,
      specifiedType: const FullType(GEOrderCreatedSchema),
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
    GEOrderTransactionSchema object, {
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
    required GEOrderTransactionSchemaBuilder result,
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
        case r'order':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GEOrderCreatedSchema),
          ) as GEOrderCreatedSchema;
          result.order.replace(valueDes);
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
  GEOrderTransactionSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GEOrderTransactionSchemaBuilder();
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
