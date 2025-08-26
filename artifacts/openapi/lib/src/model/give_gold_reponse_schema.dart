//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/give_gold_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'give_gold_reponse_schema.g.dart';

/// GiveGoldReponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class GiveGoldReponseSchema
    implements Built<GiveGoldReponseSchema, GiveGoldReponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  GiveGoldDataSchema get data;

  GiveGoldReponseSchema._();

  factory GiveGoldReponseSchema(
      [void updates(GiveGoldReponseSchemaBuilder b)]) = _$GiveGoldReponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GiveGoldReponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GiveGoldReponseSchema> get serializer =>
      _$GiveGoldReponseSchemaSerializer();
}

class _$GiveGoldReponseSchemaSerializer
    implements PrimitiveSerializer<GiveGoldReponseSchema> {
  @override
  final Iterable<Type> types = const [
    GiveGoldReponseSchema,
    _$GiveGoldReponseSchema
  ];

  @override
  final String wireName = r'GiveGoldReponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GiveGoldReponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(GiveGoldDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GiveGoldReponseSchema object, {
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
    required GiveGoldReponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GiveGoldDataSchema),
          ) as GiveGoldDataSchema;
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
  GiveGoldReponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GiveGoldReponseSchemaBuilder();
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
