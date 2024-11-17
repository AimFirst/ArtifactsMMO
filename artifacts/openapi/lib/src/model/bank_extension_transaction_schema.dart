//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/bank_extension_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bank_extension_transaction_schema.g.dart';

/// BankExtensionTransactionSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [transaction] - Transaction details.
/// * [character] - Player details.
@BuiltValue()
abstract class BankExtensionTransactionSchema
    implements
        Built<BankExtensionTransactionSchema,
            BankExtensionTransactionSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Transaction details.
  @BuiltValueField(wireName: r'transaction')
  BankExtensionSchema get transaction;

  /// Player details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  BankExtensionTransactionSchema._();

  factory BankExtensionTransactionSchema(
          [void updates(BankExtensionTransactionSchemaBuilder b)]) =
      _$BankExtensionTransactionSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BankExtensionTransactionSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BankExtensionTransactionSchema> get serializer =>
      _$BankExtensionTransactionSchemaSerializer();
}

class _$BankExtensionTransactionSchemaSerializer
    implements PrimitiveSerializer<BankExtensionTransactionSchema> {
  @override
  final Iterable<Type> types = const [
    BankExtensionTransactionSchema,
    _$BankExtensionTransactionSchema
  ];

  @override
  final String wireName = r'BankExtensionTransactionSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BankExtensionTransactionSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(CooldownSchema),
    );
    yield r'transaction';
    yield serializers.serialize(
      object.transaction,
      specifiedType: const FullType(BankExtensionSchema),
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
    BankExtensionTransactionSchema object, {
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
    required BankExtensionTransactionSchemaBuilder result,
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
        case r'transaction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BankExtensionSchema),
          ) as BankExtensionSchema;
          result.transaction.replace(valueDes);
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
  BankExtensionTransactionSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BankExtensionTransactionSchemaBuilder();
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
