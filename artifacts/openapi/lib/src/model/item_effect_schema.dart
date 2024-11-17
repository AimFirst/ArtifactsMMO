//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'item_effect_schema.g.dart';

/// ItemEffectSchema
///
/// Properties:
/// * [name] - Effect name.
/// * [value] - Effect value.
@BuiltValue()
abstract class ItemEffectSchema
    implements Built<ItemEffectSchema, ItemEffectSchemaBuilder> {
  /// Effect name.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Effect value.
  @BuiltValueField(wireName: r'value')
  int get value;

  ItemEffectSchema._();

  factory ItemEffectSchema([void updates(ItemEffectSchemaBuilder b)]) =
      _$ItemEffectSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ItemEffectSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ItemEffectSchema> get serializer =>
      _$ItemEffectSchemaSerializer();
}

class _$ItemEffectSchemaSerializer
    implements PrimitiveSerializer<ItemEffectSchema> {
  @override
  final Iterable<Type> types = const [ItemEffectSchema, _$ItemEffectSchema];

  @override
  final String wireName = r'ItemEffectSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ItemEffectSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ItemEffectSchema object, {
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
    required ItemEffectSchemaBuilder result,
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
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
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
  ItemEffectSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ItemEffectSchemaBuilder();
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
