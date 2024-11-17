//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'destination_schema.g.dart';

/// DestinationSchema
///
/// Properties:
/// * [x] - The x coordinate of the destination.
/// * [y] - The y coordinate of the destination.
@BuiltValue()
abstract class DestinationSchema
    implements Built<DestinationSchema, DestinationSchemaBuilder> {
  /// The x coordinate of the destination.
  @BuiltValueField(wireName: r'x')
  int get x;

  /// The y coordinate of the destination.
  @BuiltValueField(wireName: r'y')
  int get y;

  DestinationSchema._();

  factory DestinationSchema([void updates(DestinationSchemaBuilder b)]) =
      _$DestinationSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DestinationSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DestinationSchema> get serializer =>
      _$DestinationSchemaSerializer();
}

class _$DestinationSchemaSerializer
    implements PrimitiveSerializer<DestinationSchema> {
  @override
  final Iterable<Type> types = const [DestinationSchema, _$DestinationSchema];

  @override
  final String wireName = r'DestinationSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DestinationSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'x';
    yield serializers.serialize(
      object.x,
      specifiedType: const FullType(int),
    );
    yield r'y';
    yield serializers.serialize(
      object.y,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DestinationSchema object, {
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
    required DestinationSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'x':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.x = valueDes;
          break;
        case r'y':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.y = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DestinationSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DestinationSchemaBuilder();
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
