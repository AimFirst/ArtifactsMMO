//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/simple_effect_schema.dart';
import 'package:artifacts_api/src/model/craft_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'item_schema.g.dart';

/// ItemSchema
///
/// Properties:
/// * [name] - Item name.
/// * [code] - Item code. This is the item's unique identifier (ID).
/// * [level] - Item level.
/// * [type] - Item type.
/// * [subtype] - Item subtype.
/// * [description] - Item description.
/// * [tradeable] - Item tradeable status. A non-tradeable item cannot be exchanged or sold.
/// * [effects] - List of object effects. For equipment, it will include item stats.
/// * [craft]
@BuiltValue()
abstract class ItemSchema implements Built<ItemSchema, ItemSchemaBuilder> {
  /// Item name.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Item code. This is the item's unique identifier (ID).
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Item level.
  @BuiltValueField(wireName: r'level')
  int get level;

  /// Item type.
  @BuiltValueField(wireName: r'type')
  String get type;

  /// Item subtype.
  @BuiltValueField(wireName: r'subtype')
  String get subtype;

  /// Item description.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Item tradeable status. A non-tradeable item cannot be exchanged or sold.
  @BuiltValueField(wireName: r'tradeable')
  bool get tradeable;

  /// List of object effects. For equipment, it will include item stats.
  @BuiltValueField(wireName: r'effects')
  BuiltList<SimpleEffectSchema>? get effects;

  @BuiltValueField(wireName: r'craft')
  CraftSchema? get craft;

  ItemSchema._();

  factory ItemSchema([void updates(ItemSchemaBuilder b)]) = _$ItemSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ItemSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ItemSchema> get serializer => _$ItemSchemaSerializer();
}

class _$ItemSchemaSerializer implements PrimitiveSerializer<ItemSchema> {
  @override
  final Iterable<Type> types = const [ItemSchema, _$ItemSchema];

  @override
  final String wireName = r'ItemSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ItemSchema object, {
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
    yield r'level';
    yield serializers.serialize(
      object.level,
      specifiedType: const FullType(int),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
    yield r'subtype';
    yield serializers.serialize(
      object.subtype,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'tradeable';
    yield serializers.serialize(
      object.tradeable,
      specifiedType: const FullType(bool),
    );
    if (object.effects != null) {
      yield r'effects';
      yield serializers.serialize(
        object.effects,
        specifiedType:
            const FullType(BuiltList, [FullType(SimpleEffectSchema)]),
      );
    }
    if (object.craft != null) {
      yield r'craft';
      yield serializers.serialize(
        object.craft,
        specifiedType: const FullType.nullable(CraftSchema),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ItemSchema object, {
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
    required ItemSchemaBuilder result,
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
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.level = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'subtype':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.subtype = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'tradeable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.tradeable = valueDes;
          break;
        case r'effects':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SimpleEffectSchema)]),
          ) as BuiltList<SimpleEffectSchema>;
          result.effects.replace(valueDes);
          break;
        case r'craft':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CraftSchema),
          ) as CraftSchema?;
          if (valueDes == null) continue;
          result.craft.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ItemSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ItemSchemaBuilder();
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
