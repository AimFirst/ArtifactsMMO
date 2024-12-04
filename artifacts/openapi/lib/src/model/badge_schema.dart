//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/badge_condition_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'badge_schema.g.dart';

/// BadgeSchema
///
/// Properties:
/// * [code] - Code of the badge. This is the badge's unique identifier (ID).
/// * [description] - Description of the badge.
/// * [conditions] - Conditions to get the badge.
/// * [season]
@BuiltValue()
abstract class BadgeSchema implements Built<BadgeSchema, BadgeSchemaBuilder> {
  /// Code of the badge. This is the badge's unique identifier (ID).
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Description of the badge.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Conditions to get the badge.
  @BuiltValueField(wireName: r'conditions')
  BuiltList<BadgeConditionSchema> get conditions;

  @BuiltValueField(wireName: r'season')
  int? get season;

  BadgeSchema._();

  factory BadgeSchema([void updates(BadgeSchemaBuilder b)]) = _$BadgeSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BadgeSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BadgeSchema> get serializer => _$BadgeSchemaSerializer();
}

class _$BadgeSchemaSerializer implements PrimitiveSerializer<BadgeSchema> {
  @override
  final Iterable<Type> types = const [BadgeSchema, _$BadgeSchema];

  @override
  final String wireName = r'BadgeSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BadgeSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'conditions';
    yield serializers.serialize(
      object.conditions,
      specifiedType:
          const FullType(BuiltList, [FullType(BadgeConditionSchema)]),
    );
    if (object.season != null) {
      yield r'season';
      yield serializers.serialize(
        object.season,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BadgeSchema object, {
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
    required BadgeSchemaBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'conditions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(BadgeConditionSchema)]),
          ) as BuiltList<BadgeConditionSchema>;
          result.conditions.replace(valueDes);
          break;
        case r'season':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.season = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BadgeSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BadgeSchemaBuilder();
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
