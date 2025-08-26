//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/give_item_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'give_item_reponse_schema.g.dart';

/// GiveItemReponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class GiveItemReponseSchema
    implements Built<GiveItemReponseSchema, GiveItemReponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  GiveItemDataSchema get data;

  GiveItemReponseSchema._();

  factory GiveItemReponseSchema(
      [void updates(GiveItemReponseSchemaBuilder b)]) = _$GiveItemReponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GiveItemReponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GiveItemReponseSchema> get serializer =>
      _$GiveItemReponseSchemaSerializer();
}

class _$GiveItemReponseSchemaSerializer
    implements PrimitiveSerializer<GiveItemReponseSchema> {
  @override
  final Iterable<Type> types = const [
    GiveItemReponseSchema,
    _$GiveItemReponseSchema
  ];

  @override
  final String wireName = r'GiveItemReponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GiveItemReponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(GiveItemDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GiveItemReponseSchema object, {
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
    required GiveItemReponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GiveItemDataSchema),
          ) as GiveItemDataSchema;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GiveItemReponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GiveItemReponseSchemaBuilder();
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
