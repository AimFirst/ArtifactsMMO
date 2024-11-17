//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'blocked_hits_schema.g.dart';

/// BlockedHitsSchema
///
/// Properties:
/// * [fire] - The amount of fire hits blocked.
/// * [earth] - The amount of earth hits blocked.
/// * [water] - The amount of water hits blocked.
/// * [air] - The amount of air hits blocked.
/// * [total] - The amount of total hits blocked.
@BuiltValue()
abstract class BlockedHitsSchema
    implements Built<BlockedHitsSchema, BlockedHitsSchemaBuilder> {
  /// The amount of fire hits blocked.
  @BuiltValueField(wireName: r'fire')
  int get fire;

  /// The amount of earth hits blocked.
  @BuiltValueField(wireName: r'earth')
  int get earth;

  /// The amount of water hits blocked.
  @BuiltValueField(wireName: r'water')
  int get water;

  /// The amount of air hits blocked.
  @BuiltValueField(wireName: r'air')
  int get air;

  /// The amount of total hits blocked.
  @BuiltValueField(wireName: r'total')
  int get total;

  BlockedHitsSchema._();

  factory BlockedHitsSchema([void updates(BlockedHitsSchemaBuilder b)]) =
      _$BlockedHitsSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BlockedHitsSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BlockedHitsSchema> get serializer =>
      _$BlockedHitsSchemaSerializer();
}

class _$BlockedHitsSchemaSerializer
    implements PrimitiveSerializer<BlockedHitsSchema> {
  @override
  final Iterable<Type> types = const [BlockedHitsSchema, _$BlockedHitsSchema];

  @override
  final String wireName = r'BlockedHitsSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BlockedHitsSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'fire';
    yield serializers.serialize(
      object.fire,
      specifiedType: const FullType(int),
    );
    yield r'earth';
    yield serializers.serialize(
      object.earth,
      specifiedType: const FullType(int),
    );
    yield r'water';
    yield serializers.serialize(
      object.water,
      specifiedType: const FullType(int),
    );
    yield r'air';
    yield serializers.serialize(
      object.air,
      specifiedType: const FullType(int),
    );
    yield r'total';
    yield serializers.serialize(
      object.total,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BlockedHitsSchema object, {
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
    required BlockedHitsSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'fire':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.fire = valueDes;
          break;
        case r'earth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.earth = valueDes;
          break;
        case r'water':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.water = valueDes;
          break;
        case r'air':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.air = valueDes;
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BlockedHitsSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BlockedHitsSchemaBuilder();
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
