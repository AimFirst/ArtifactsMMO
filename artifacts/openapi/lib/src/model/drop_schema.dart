//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'drop_schema.g.dart';

/// DropSchema
///
/// Properties:
/// * [code] - The code of the item.
/// * [quantity] - The quantity of the item.
@BuiltValue()
abstract class DropSchema implements Built<DropSchema, DropSchemaBuilder> {
  /// The code of the item.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// The quantity of the item.
  @BuiltValueField(wireName: r'quantity')
  int get quantity;

  DropSchema._();

  factory DropSchema([void updates(DropSchemaBuilder b)]) = _$DropSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DropSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DropSchema> get serializer => _$DropSchemaSerializer();
}

class _$DropSchemaSerializer implements PrimitiveSerializer<DropSchema> {
  @override
  final Iterable<Type> types = const [DropSchema, _$DropSchema];

  @override
  final String wireName = r'DropSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DropSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'quantity';
    yield serializers.serialize(
      object.quantity,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DropSchema object, {
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
    required DropSchemaBuilder result,
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
  DropSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DropSchemaBuilder();
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
