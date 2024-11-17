//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/equip_request_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'equipment_response_schema.g.dart';

/// EquipmentResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class EquipmentResponseSchema
    implements Built<EquipmentResponseSchema, EquipmentResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  EquipRequestSchema get data;

  EquipmentResponseSchema._();

  factory EquipmentResponseSchema(
          [void updates(EquipmentResponseSchemaBuilder b)]) =
      _$EquipmentResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EquipmentResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EquipmentResponseSchema> get serializer =>
      _$EquipmentResponseSchemaSerializer();
}

class _$EquipmentResponseSchemaSerializer
    implements PrimitiveSerializer<EquipmentResponseSchema> {
  @override
  final Iterable<Type> types = const [
    EquipmentResponseSchema,
    _$EquipmentResponseSchema
  ];

  @override
  final String wireName = r'EquipmentResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EquipmentResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(EquipRequestSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EquipmentResponseSchema object, {
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
    required EquipmentResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EquipRequestSchema),
          ) as EquipRequestSchema;
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
  EquipmentResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EquipmentResponseSchemaBuilder();
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
