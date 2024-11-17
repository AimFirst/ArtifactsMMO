//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/gathering_skill.dart';
import 'package:artifacts_api/src/model/drop_rate_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'resource_schema.g.dart';

/// ResourceSchema
///
/// Properties:
/// * [name] - The name of the resource
/// * [code] - The code of the resource. This is the resource's unique identifier (ID).
/// * [skill] - The skill required to gather this resource.
/// * [level] - The skill level required to gather this resource.
/// * [drops] - The drops of this resource.
@BuiltValue()
abstract class ResourceSchema
    implements Built<ResourceSchema, ResourceSchemaBuilder> {
  /// The name of the resource
  @BuiltValueField(wireName: r'name')
  String get name;

  /// The code of the resource. This is the resource's unique identifier (ID).
  @BuiltValueField(wireName: r'code')
  String get code;

  /// The skill required to gather this resource.
  @BuiltValueField(wireName: r'skill')
  GatheringSkill get skill;
  // enum skillEnum {  mining,  woodcutting,  fishing,  alchemy,  };

  /// The skill level required to gather this resource.
  @BuiltValueField(wireName: r'level')
  int get level;

  /// The drops of this resource.
  @BuiltValueField(wireName: r'drops')
  BuiltList<DropRateSchema> get drops;

  ResourceSchema._();

  factory ResourceSchema([void updates(ResourceSchemaBuilder b)]) =
      _$ResourceSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResourceSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResourceSchema> get serializer =>
      _$ResourceSchemaSerializer();
}

class _$ResourceSchemaSerializer
    implements PrimitiveSerializer<ResourceSchema> {
  @override
  final Iterable<Type> types = const [ResourceSchema, _$ResourceSchema];

  @override
  final String wireName = r'ResourceSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResourceSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'skill';
    yield serializers.serialize(
      object.skill,
      specifiedType: const FullType(GatheringSkill),
    );
    yield r'level';
    yield serializers.serialize(
      object.level,
      specifiedType: const FullType(int),
    );
    yield r'drops';
    yield serializers.serialize(
      object.drops,
      specifiedType: const FullType(BuiltList, [FullType(DropRateSchema)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ResourceSchema object, {
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
    required ResourceSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'skill':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GatheringSkill),
          ) as GatheringSkill;
          result.skill = valueDes;
          break;
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.level = valueDes;
          break;
        case r'drops':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(DropRateSchema)]),
          ) as BuiltList<DropRateSchema>;
          result.drops.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ResourceSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResourceSchemaBuilder();
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
