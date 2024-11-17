//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/simple_item_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task_rewards_schema.g.dart';

/// TaskRewardsSchema
///
/// Properties:
/// * [items] - Items rewards.
/// * [gold] - Gold rewards.
@BuiltValue()
abstract class TaskRewardsSchema
    implements Built<TaskRewardsSchema, TaskRewardsSchemaBuilder> {
  /// Items rewards.
  @BuiltValueField(wireName: r'items')
  BuiltList<SimpleItemSchema> get items;

  /// Gold rewards.
  @BuiltValueField(wireName: r'gold')
  int get gold;

  TaskRewardsSchema._();

  factory TaskRewardsSchema([void updates(TaskRewardsSchemaBuilder b)]) =
      _$TaskRewardsSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaskRewardsSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaskRewardsSchema> get serializer =>
      _$TaskRewardsSchemaSerializer();
}

class _$TaskRewardsSchemaSerializer
    implements PrimitiveSerializer<TaskRewardsSchema> {
  @override
  final Iterable<Type> types = const [TaskRewardsSchema, _$TaskRewardsSchema];

  @override
  final String wireName = r'TaskRewardsSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaskRewardsSchema object, {
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
    TaskRewardsSchema object, {
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
    required TaskRewardsSchemaBuilder result,
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
  TaskRewardsSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaskRewardsSchemaBuilder();
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
