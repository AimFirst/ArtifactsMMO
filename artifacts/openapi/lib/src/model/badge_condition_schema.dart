//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'badge_condition_schema.g.dart';

/// BadgeConditionSchema
///
/// Properties:
/// * [code] - Code of the condition.
/// * [quantity]
@BuiltValue()
abstract class BadgeConditionSchema
    implements Built<BadgeConditionSchema, BadgeConditionSchemaBuilder> {
  /// Code of the condition.
  @BuiltValueField(wireName: r'code')
  String get code;

  @BuiltValueField(wireName: r'quantity')
  int? get quantity;

  BadgeConditionSchema._();

  factory BadgeConditionSchema([void updates(BadgeConditionSchemaBuilder b)]) =
      _$BadgeConditionSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BadgeConditionSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BadgeConditionSchema> get serializer =>
      _$BadgeConditionSchemaSerializer();
}

class _$BadgeConditionSchemaSerializer
    implements PrimitiveSerializer<BadgeConditionSchema> {
  @override
  final Iterable<Type> types = const [
    BadgeConditionSchema,
    _$BadgeConditionSchema
  ];

  @override
  final String wireName = r'BadgeConditionSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BadgeConditionSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'quantity';
    yield object.quantity == null
        ? null
        : serializers.serialize(
            object.quantity,
            specifiedType: const FullType.nullable(int),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    BadgeConditionSchema object, {
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
    required BadgeConditionSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
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
  BadgeConditionSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BadgeConditionSchemaBuilder();
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
