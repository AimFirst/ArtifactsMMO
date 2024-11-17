//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'deposit_withdraw_gold_schema.g.dart';

/// DepositWithdrawGoldSchema
///
/// Properties:
/// * [quantity] - Quantity of gold.
@BuiltValue()
abstract class DepositWithdrawGoldSchema
    implements
        Built<DepositWithdrawGoldSchema, DepositWithdrawGoldSchemaBuilder> {
  /// Quantity of gold.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  DepositWithdrawGoldSchema._();

  factory DepositWithdrawGoldSchema(
          [void updates(DepositWithdrawGoldSchemaBuilder b)]) =
      _$DepositWithdrawGoldSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DepositWithdrawGoldSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DepositWithdrawGoldSchema> get serializer =>
      _$DepositWithdrawGoldSchemaSerializer();
}

class _$DepositWithdrawGoldSchemaSerializer
    implements PrimitiveSerializer<DepositWithdrawGoldSchema> {
  @override
  final Iterable<Type> types = const [
    DepositWithdrawGoldSchema,
    _$DepositWithdrawGoldSchema
  ];

  @override
  final String wireName = r'DepositWithdrawGoldSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DepositWithdrawGoldSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DepositWithdrawGoldSchema object, {
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
    required DepositWithdrawGoldSchemaBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DepositWithdrawGoldSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DepositWithdrawGoldSchemaBuilder();
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
