//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/ge_order_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ge_order_reponse_schema.g.dart';

/// GEOrderReponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class GEOrderReponseSchema
    implements Built<GEOrderReponseSchema, GEOrderReponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  GEOrderSchema get data;

  GEOrderReponseSchema._();

  factory GEOrderReponseSchema([void updates(GEOrderReponseSchemaBuilder b)]) =
      _$GEOrderReponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GEOrderReponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GEOrderReponseSchema> get serializer =>
      _$GEOrderReponseSchemaSerializer();
}

class _$GEOrderReponseSchemaSerializer
    implements PrimitiveSerializer<GEOrderReponseSchema> {
  @override
  final Iterable<Type> types = const [
    GEOrderReponseSchema,
    _$GEOrderReponseSchema
  ];

  @override
  final String wireName = r'GEOrderReponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GEOrderReponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(GEOrderSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GEOrderReponseSchema object, {
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
    required GEOrderReponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GEOrderSchema),
          ) as GEOrderSchema;
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
  GEOrderReponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GEOrderReponseSchemaBuilder();
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
