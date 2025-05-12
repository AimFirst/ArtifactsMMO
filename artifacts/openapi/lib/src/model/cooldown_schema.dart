//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/action_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cooldown_schema.g.dart';

/// CooldownSchema
///
/// Properties:
/// * [totalSeconds] - The total seconds of the cooldown.
/// * [remainingSeconds] - The remaining seconds of the cooldown.
/// * [startedAt] - The start of the cooldown.
/// * [expiration] - The expiration of the cooldown.
/// * [reason] - The reason of the cooldown.
@BuiltValue()
abstract class CooldownSchema
    implements Built<CooldownSchema, CooldownSchemaBuilder> {
  /// The total seconds of the cooldown.
  @BuiltValueField(wireName: r'total_seconds')
  int get totalSeconds;

  /// The remaining seconds of the cooldown.
  @BuiltValueField(wireName: r'remaining_seconds')
  int get remainingSeconds;

  /// The start of the cooldown.
  @BuiltValueField(wireName: r'started_at')
  DateTime get startedAt;

  /// The expiration of the cooldown.
  @BuiltValueField(wireName: r'expiration')
  DateTime get expiration;

  /// The reason of the cooldown.
  @BuiltValueField(wireName: r'reason')
  ActionType get reason;
  // enum reasonEnum {  movement,  fight,  crafting,  gathering,  buy_ge,  sell_ge,  buy_npc,  sell_npc,  cancel_ge,  delete_item,  deposit,  withdraw,  deposit_gold,  withdraw_gold,  equip,  unequip,  task,  christmas_exchange,  recycling,  rest,  use,  buy_bank_expansion,  };

  CooldownSchema._();

  factory CooldownSchema([void updates(CooldownSchemaBuilder b)]) =
      _$CooldownSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CooldownSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CooldownSchema> get serializer =>
      _$CooldownSchemaSerializer();
}

class _$CooldownSchemaSerializer
    implements PrimitiveSerializer<CooldownSchema> {
  @override
  final Iterable<Type> types = const [CooldownSchema, _$CooldownSchema];

  @override
  final String wireName = r'CooldownSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CooldownSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'total_seconds';
    yield serializers.serialize(
      object.totalSeconds,
      specifiedType: const FullType(int),
    );
    yield r'remaining_seconds';
    yield serializers.serialize(
      object.remainingSeconds,
      specifiedType: const FullType(int),
    );
    yield r'started_at';
    yield serializers.serialize(
      object.startedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'expiration';
    yield serializers.serialize(
      object.expiration,
      specifiedType: const FullType(DateTime),
    );
    yield r'reason';
    yield serializers.serialize(
      object.reason,
      specifiedType: const FullType(ActionType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CooldownSchema object, {
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
    required CooldownSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalSeconds = valueDes;
          break;
        case r'remaining_seconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.remainingSeconds = valueDes;
          break;
        case r'started_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startedAt = valueDes;
          break;
        case r'expiration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiration = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ActionType),
          ) as ActionType;
          result.reason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CooldownSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CooldownSchemaBuilder();
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
