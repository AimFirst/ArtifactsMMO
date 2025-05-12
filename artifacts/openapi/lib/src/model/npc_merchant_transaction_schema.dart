//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/cooldown_schema.dart';
import 'package:artifacts_api/src/model/npc_item_transaction_schema.dart';
import 'package:artifacts_api/src/model/character_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'npc_merchant_transaction_schema.g.dart';

/// NpcMerchantTransactionSchema
///
/// Properties:
/// * [cooldown] - Cooldown details.
/// * [transaction] - Transaction details.
/// * [character] - Character details.
@BuiltValue()
abstract class NpcMerchantTransactionSchema
    implements
        Built<NpcMerchantTransactionSchema,
            NpcMerchantTransactionSchemaBuilder> {
  /// Cooldown details.
  @BuiltValueField(wireName: r'cooldown')
  CooldownSchema get cooldown;

  /// Transaction details.
  @BuiltValueField(wireName: r'transaction')
  NpcItemTransactionSchema get transaction;

  /// Character details.
  @BuiltValueField(wireName: r'character')
  CharacterSchema get character;

  NpcMerchantTransactionSchema._();

  factory NpcMerchantTransactionSchema(
          [void updates(NpcMerchantTransactionSchemaBuilder b)]) =
      _$NpcMerchantTransactionSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NpcMerchantTransactionSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NpcMerchantTransactionSchema> get serializer =>
      _$NpcMerchantTransactionSchemaSerializer();
}

class _$NpcMerchantTransactionSchemaSerializer
    implements PrimitiveSerializer<NpcMerchantTransactionSchema> {
  @override
  final Iterable<Type> types = const [
    NpcMerchantTransactionSchema,
    _$NpcMerchantTransactionSchema
  ];

  @override
  final String wireName = r'NpcMerchantTransactionSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NpcMerchantTransactionSchema object, {
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
      specifiedType: const FullType(NpcItemTransactionSchema),
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
    NpcMerchantTransactionSchema object, {
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
    required NpcMerchantTransactionSchemaBuilder result,
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
            specifiedType: const FullType(NpcItemTransactionSchema),
          ) as NpcItemTransactionSchema;
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
  NpcMerchantTransactionSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NpcMerchantTransactionSchemaBuilder();
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
