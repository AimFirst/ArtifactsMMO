//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/drop_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'skill_info_schema.g.dart';

/// SkillInfoSchema
///
/// Properties:
/// * [xp] - The amount of xp gained.
/// * [items] - Objects received.
@BuiltValue()
abstract class SkillInfoSchema
    implements Built<SkillInfoSchema, SkillInfoSchemaBuilder> {
  /// The amount of xp gained.
  @BuiltValueField(wireName: r'xp')
  int get xp;

  /// Objects received.
  @BuiltValueField(wireName: r'items')
  BuiltList<DropSchema> get items;

  SkillInfoSchema._();

  factory SkillInfoSchema([void updates(SkillInfoSchemaBuilder b)]) =
      _$SkillInfoSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SkillInfoSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SkillInfoSchema> get serializer =>
      _$SkillInfoSchemaSerializer();
}

class _$SkillInfoSchemaSerializer
    implements PrimitiveSerializer<SkillInfoSchema> {
  @override
  final Iterable<Type> types = const [SkillInfoSchema, _$SkillInfoSchema];

  @override
  final String wireName = r'SkillInfoSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SkillInfoSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'xp';
    yield serializers.serialize(
      object.xp,
      specifiedType: const FullType(int),
    );
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(DropSchema)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SkillInfoSchema object, {
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
    required SkillInfoSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'xp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.xp = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DropSchema)]),
          ) as BuiltList<DropSchema>;
          result.items.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SkillInfoSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SkillInfoSchemaBuilder();
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
