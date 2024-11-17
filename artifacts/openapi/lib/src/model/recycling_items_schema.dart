//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/drop_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recycling_items_schema.g.dart';

/// RecyclingItemsSchema
///
/// Properties:
/// * [items] - Objects received.
@BuiltValue()
abstract class RecyclingItemsSchema
    implements Built<RecyclingItemsSchema, RecyclingItemsSchemaBuilder> {
  /// Objects received.
  @BuiltValueField(wireName: r'items')
  BuiltList<DropSchema> get items;

  RecyclingItemsSchema._();

  factory RecyclingItemsSchema([void updates(RecyclingItemsSchemaBuilder b)]) =
      _$RecyclingItemsSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecyclingItemsSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecyclingItemsSchema> get serializer =>
      _$RecyclingItemsSchemaSerializer();
}

class _$RecyclingItemsSchemaSerializer
    implements PrimitiveSerializer<RecyclingItemsSchema> {
  @override
  final Iterable<Type> types = const [
    RecyclingItemsSchema,
    _$RecyclingItemsSchema
  ];

  @override
  final String wireName = r'RecyclingItemsSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecyclingItemsSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(DropSchema)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RecyclingItemsSchema object, {
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
    required RecyclingItemsSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  RecyclingItemsSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecyclingItemsSchemaBuilder();
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
