//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/gold_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bank_gold_transaction_schema.g.dart';

/// BankGoldTransactionSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [bank] - Bank details.
/// * [character] - Player details.
@BuiltValue()
abstract class BankGoldTransactionSchema
    implements
        Built<BankGoldTransactionSchema, BankGoldTransactionSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Bank details.
  @BuiltValueField(wireName: r'bank')
  GoldSchema get bank;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  BankGoldTransactionSchema._();

  factory BankGoldTransactionSchema(
          [void updates(BankGoldTransactionSchemaBuilder b)]) =
      _$BankGoldTransactionSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BankGoldTransactionSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BankGoldTransactionSchema> get serializer =>
      _$BankGoldTransactionSchemaSerializer();
}

class _$BankGoldTransactionSchemaSerializer
    implements PrimitiveSerializer<BankGoldTransactionSchema> {
  @override
  final Iterable<Type> types = const [
    BankGoldTransactionSchema,
    _$BankGoldTransactionSchema
  ];

  @override
  final String wireName = r'BankGoldTransactionSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BankGoldTransactionSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'bank';
    yield serializers.serialize(
      object.bank,
      specifiedType: const FullType(GoldSchema),
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
    BankGoldTransactionSchema object, {
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
    required BankGoldTransactionSchemaBuilder result,
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
        case r'bank':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GoldSchema),
          ) as GoldSchema;
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
  BankGoldTransactionSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BankGoldTransactionSchemaBuilder();
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
