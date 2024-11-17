//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/ge_transaction_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_transaction_list_schema.g.dart';

/// GETransactionListSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [order] - Transaction details.
/// * [character] - Character details.
@BuiltValue()
abstract class GETransactionListSchema
    implements Built<GETransactionListSchema, GETransactionListSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Transaction details.
  @BuiltValueField(wireName: r'order')
  GETransactionSchema get order;

  /// Character details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  GETransactionListSchema._();

  factory GETransactionListSchema(
          [void updates(GETransactionListSchemaBuilder b)]) =
      _$GETransactionListSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GETransactionListSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GETransactionListSchema> get serializer =>
      _$GETransactionListSchemaSerializer();
}

class _$GETransactionListSchemaSerializer
    implements PrimitiveSerializer<GETransactionListSchema> {
  @override
  final Iterable<Type> types = const [
    GETransactionListSchema,
    _$GETransactionListSchema
  ];

  @override
  final String wireName = r'GETransactionListSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GETransactionListSchema object, {
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
      specifiedType: const FullType(GETransactionSchema),
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
    GETransactionListSchema object, {
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
    required GETransactionListSchemaBuilder result,
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
            specifiedType: const FullType(GETransactionSchema),
          ) as GETransactionSchema;
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
  GETransactionListSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GETransactionListSchemaBuilder();
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
