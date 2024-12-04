//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/simple_item_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rewards_schema.g.dart';

/// RewardsSchema
///
/// Properties:
/// * [items] - Items rewards.
/// * [gold] - Gold rewards.
@BuiltValue()
abstract class RewardsSchema
    implements Built<RewardsSchema, RewardsSchemaBuilder> {
  /// Items rewards.
  @BuiltValueField(wireName: r'items')
  BuiltList<SimpleItemSchema> get items;

  /// Gold rewards.
  @BuiltValueField(wireName: r'gold')
  int get gold;

  RewardsSchema._();

  factory RewardsSchema([void updates(RewardsSchemaBuilder b)]) =
      _$RewardsSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RewardsSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RewardsSchema> get serializer =>
      _$RewardsSchemaSerializer();
}

class _$RewardsSchemaSerializer implements PrimitiveSerializer<RewardsSchema> {
  @override
  final Iterable<Type> types = const [RewardsSchema, _$RewardsSchema];

  @override
  final String wireName = r'RewardsSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RewardsSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(SimpleItemSchema)]),
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
    RewardsSchema object, {
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
    required RewardsSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SimpleItemSchema)]),
          ) as BuiltList<SimpleItemSchema>;
          result.items.replace(valueDes);
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
  RewardsSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RewardsSchemaBuilder();
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
