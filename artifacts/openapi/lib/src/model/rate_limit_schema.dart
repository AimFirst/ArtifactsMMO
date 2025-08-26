//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rate_limit_schema.g.dart';

/// RateLimitSchema
///
/// Properties:
/// * [type] - Type of rate limit.
/// * [value] - Value of the rate limit.
@BuiltValue()
abstract class RateLimitSchema
    implements Built<RateLimitSchema, RateLimitSchemaBuilder> {
  /// Type of rate limit.
  @BuiltValueField(wireName: r'type')
  String get type;

  /// Value of the rate limit.
  @BuiltValueField(wireName: r'value')
  String get value;

  RateLimitSchema._();

  factory RateLimitSchema([void updates(RateLimitSchemaBuilder b)]) =
      _$RateLimitSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RateLimitSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RateLimitSchema> get serializer =>
      _$RateLimitSchemaSerializer();
}

class _$RateLimitSchemaSerializer
    implements PrimitiveSerializer<RateLimitSchema> {
  @override
  final Iterable<Type> types = const [RateLimitSchema, _$RateLimitSchema];

  @override
  final String wireName = r'RateLimitSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RateLimitSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RateLimitSchema object, {
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
    required RateLimitSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RateLimitSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RateLimitSchemaBuilder();
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
