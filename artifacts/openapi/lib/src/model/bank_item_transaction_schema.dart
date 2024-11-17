//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/item_schema.dart';
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/simple_item_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bank_item_transaction_schema.g.dart';

/// BankItemTransactionSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [item] - Item details.
/// * [bank] - Items in your banks.
/// * [character] - Player details.
@BuiltValue()
abstract class BankItemTransactionSchema
    implements
        Built<BankItemTransactionSchema, BankItemTransactionSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Item details.
  @BuiltValueField(wireName: r'item')
  ItemSchema get item;

  /// Items in your banks.
  @BuiltValueField(wireName: r'bank')
  BuiltList<SimpleItemSchema> get bank;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  BankItemTransactionSchema._();

  factory BankItemTransactionSchema(
          [void updates(BankItemTransactionSchemaBuilder b)]) =
      _$BankItemTransactionSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BankItemTransactionSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BankItemTransactionSchema> get serializer =>
      _$BankItemTransactionSchemaSerializer();
}

class _$BankItemTransactionSchemaSerializer
    implements PrimitiveSerializer<BankItemTransactionSchema> {
  @override
  final Iterable<Type> types = const [
    BankItemTransactionSchema,
    _$BankItemTransactionSchema
  ];

  @override
  final String wireName = r'BankItemTransactionSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BankItemTransactionSchema object, {
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
      specifiedType: const FullType(ItemSchema),
    );
    yield r'bank';
    yield serializers.serialize(
      object.bank,
      specifiedType: const FullType(BuiltList, [FullType(SimpleItemSchema)]),
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
    BankItemTransactionSchema object, {
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
    required BankItemTransactionSchemaBuilder result,
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
            specifiedType: const FullType(ItemSchema),
          ) as ItemSchema;
          result.item.replace(valueDes);
          break;
        case r'bank':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SimpleItemSchema)]),
          ) as BuiltList<SimpleItemSchema>;
          result.bank.replace(valueDes);
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
  BankItemTransactionSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BankItemTransactionSchemaBuilder();
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
