//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bank_schema.g.dart';

/// BankSchema
///
/// Properties:
/// * [slots] - Maximum slots in your bank.
/// * [expansions] - Bank expansions.
/// * [nextExpansionCost] - Next expansion cost.
/// * [gold] - Quantity of gold in your bank.
@BuiltValue()
abstract class BankSchema implements Built<BankSchema, BankSchemaBuilder> {
  /// Maximum slots in your bank.
  @BuiltValueField(wireName: r'slots')
  int get slots;

  /// Bank expansions.
  @BuiltValueField(wireName: r'expansions')
  int get expansions;

  /// Next expansion cost.
  @BuiltValueField(wireName: r'next_expansion_cost')
  int get nextExpansionCost;

  /// Quantity of gold in your bank.
  @BuiltValueField(wireName: r'gold')
  int get gold;

  BankSchema._();

  factory BankSchema([void updates(BankSchemaBuilder b)]) = _$BankSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BankSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BankSchema> get serializer => _$BankSchemaSerializer();
}

class _$BankSchemaSerializer implements PrimitiveSerializer<BankSchema> {
  @override
  final Iterable<Type> types = const [BankSchema, _$BankSchema];

  @override
  final String wireName = r'BankSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BankSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'slots';
    yield serializers.serialize(
      object.slots,
      specifiedType: const FullType(int),
    );
    yield r'expansions';
    yield serializers.serialize(
      object.expansions,
      specifiedType: const FullType(int),
    );
    yield r'next_expansion_cost';
    yield serializers.serialize(
      object.nextExpansionCost,
      specifiedType: const FullType(int),
    );
    yield r'gold';
    yield serializers.serialize(
      object.gold,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BankSchema object, {
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
    required BankSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'slots':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.slots = valueDes;
          break;
        case r'expansions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.expansions = valueDes;
          break;
        case r'next_expansion_cost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.nextExpansionCost = valueDes;
          break;
        case r'gold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.gold = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BankSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BankSchemaBuilder();
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
