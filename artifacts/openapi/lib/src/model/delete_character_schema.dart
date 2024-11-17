//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_character_schema.g.dart';

/// DeleteCharacterSchema
///
/// Properties:
/// * [name] - Character name.
@BuiltValue()
abstract class DeleteCharacterSchema
    implements Built<DeleteCharacterSchema, DeleteCharacterSchemaBuilder> {
  /// Character name.
  @BuiltValueField(wireName: r'name')
  String get name;

  DeleteCharacterSchema._();

  factory DeleteCharacterSchema(
      [void updates(DeleteCharacterSchemaBuilder b)]) = _$DeleteCharacterSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteCharacterSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteCharacterSchema> get serializer =>
      _$DeleteCharacterSchemaSerializer();
}

class _$DeleteCharacterSchemaSerializer
    implements PrimitiveSerializer<DeleteCharacterSchema> {
  @override
  final Iterable<Type> types = const [
    DeleteCharacterSchema,
    _$DeleteCharacterSchema
  ];

  @override
  final String wireName = r'DeleteCharacterSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeleteCharacterSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DeleteCharacterSchema object, {
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
    required DeleteCharacterSchemaBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DeleteCharacterSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeleteCharacterSchemaBuilder();
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
