//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/change_skin_character_data_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'change_skin_response_schema.g.dart';

/// ChangeSkinResponseSchema
///
/// Properties:
/// * [data]
@BuiltValue()
abstract class ChangeSkinResponseSchema
    implements
        Built<ChangeSkinResponseSchema, ChangeSkinResponseSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  ChangeSkinCharacterDataSchema get data;

  ChangeSkinResponseSchema._();

  factory ChangeSkinResponseSchema(
          [void updates(ChangeSkinResponseSchemaBuilder b)]) =
      _$ChangeSkinResponseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChangeSkinResponseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChangeSkinResponseSchema> get serializer =>
      _$ChangeSkinResponseSchemaSerializer();
}

class _$ChangeSkinResponseSchemaSerializer
    implements PrimitiveSerializer<ChangeSkinResponseSchema> {
  @override
  final Iterable<Type> types = const [
    ChangeSkinResponseSchema,
    _$ChangeSkinResponseSchema
  ];

  @override
  final String wireName = r'ChangeSkinResponseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChangeSkinResponseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(ChangeSkinCharacterDataSchema),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ChangeSkinResponseSchema object, {
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
    required ChangeSkinResponseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ChangeSkinCharacterDataSchema),
          ) as ChangeSkinCharacterDataSchema;
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
  ChangeSkinResponseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChangeSkinResponseSchemaBuilder();
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
