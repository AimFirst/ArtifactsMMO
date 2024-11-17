//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/craft_skill.dart';
import 'package:artifacts_api/src/model/simple_item_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'craft_schema.g.dart';

/// CraftSchema
///
/// Properties:
/// * [skill] - Skill required to craft the item.
/// * [level] - The skill level required to craft the item.
/// * [items] - List of items required to craft the item.
/// * [quantity] - Quantity of items crafted.
@BuiltValue()
abstract class CraftSchema implements Built<CraftSchema, CraftSchemaBuilder> {
  /// Skill required to craft the item.
  @BuiltValueField(wireName: r'skill')
  CraftSkill? get skill;
  // enum skillEnum {  weaponcrafting,  gearcrafting,  jewelrycrafting,  cooking,  woodcutting,  mining,  alchemy,  };

  /// The skill level required to craft the item.
  @BuiltValueField(wireName: r'level')
  int? get level;

  /// List of items required to craft the item.
  @BuiltValueField(wireName: r'items')
  BuiltList<SimpleItemSchema>? get items;

  /// Quantity of items crafted.
  @BuiltValueField(wireName: r'quantity')
  int? get quantity;

  CraftSchema._();

  factory CraftSchema([void updates(CraftSchemaBuilder b)]) = _$CraftSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CraftSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CraftSchema> get serializer => _$CraftSchemaSerializer();
}

class _$CraftSchemaSerializer implements PrimitiveSerializer<CraftSchema> {
  @override
  final Iterable<Type> types = const [CraftSchema, _$CraftSchema];

  @override
  final String wireName = r'CraftSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CraftSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.skill != null) {
      yield r'skill';
      yield serializers.serialize(
        object.skill,
        specifiedType: const FullType(CraftSkill),
      );
    }
    if (object.level != null) {
      yield r'level';
      yield serializers.serialize(
        object.level,
        specifiedType: const FullType(int),
      );
    }
    if (object.items != null) {
      yield r'items';
      yield serializers.serialize(
        object.items,
        specifiedType: const FullType(BuiltList, [FullType(SimpleItemSchema)]),
      );
    }
    if (object.quantity != null) {
      yield r'quantity';
      yield serializers.serialize(
        object.quantity,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CraftSchema object, {
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
    required CraftSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'skill':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CraftSkill),
          ) as CraftSkill;
          result.skill = valueDes;
          break;
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.level = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SimpleItemSchema)]),
          ) as BuiltList<SimpleItemSchema>;
          result.items.replace(valueDes);
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
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
  CraftSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CraftSchemaBuilder();
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
