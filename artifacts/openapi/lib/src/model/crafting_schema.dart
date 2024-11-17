//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'crafting_schema.g.dart';

/// CraftingSchema
///
/// Properties:
/// * [code] - Craft code.
/// * [quantity] - Quantity of items to craft.
@BuiltValue()
abstract class CraftingSchema
    implements Built<CraftingSchema, CraftingSchemaBuilder> {
  /// Craft code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Quantity of items to craft.
  @BuiltValueField(wireName: r'quantity')
  int? get quantity;

  CraftingSchema._();

  factory CraftingSchema([void updates(CraftingSchemaBuilder b)]) =
      _$CraftingSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CraftingSchemaBuilder b) => b..quantity = 1;

  @BuiltValueSerializer(custom: true)
  static Serializer<CraftingSchema> get serializer =>
      _$CraftingSchemaSerializer();
}

class _$CraftingSchemaSerializer
    implements PrimitiveSerializer<CraftingSchema> {
  @override
  final Iterable<Type> types = const [CraftingSchema, _$CraftingSchema];

  @override
  final String wireName = r'CraftingSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CraftingSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
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
    CraftingSchema object, {
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
    required CraftingSchemaBuilder result,
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
  CraftingSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CraftingSchemaBuilder();
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
