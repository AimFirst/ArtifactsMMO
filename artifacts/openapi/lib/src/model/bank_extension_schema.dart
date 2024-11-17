//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'bank_extension_schema.g.dart';

/// BankExtensionSchema
///
/// Properties:
/// * [price] - Price of the bank extension.
@BuiltValue()
abstract class BankExtensionSchema
    implements Built<BankExtensionSchema, BankExtensionSchemaBuilder> {
  /// Price of the bank extension.
  @BuiltValueField(wireName: r'price')
  int get price;

  BankExtensionSchema._();

  factory BankExtensionSchema([void updates(BankExtensionSchemaBuilder b)]) =
      _$BankExtensionSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BankExtensionSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BankExtensionSchema> get serializer =>
      _$BankExtensionSchemaSerializer();
}

class _$BankExtensionSchemaSerializer
    implements PrimitiveSerializer<BankExtensionSchema> {
  @override
  final Iterable<Type> types = const [
    BankExtensionSchema,
    _$BankExtensionSchema
  ];

  @override
  final String wireName = r'BankExtensionSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BankExtensionSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'price';
    yield serializers.serialize(
      object.price,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BankExtensionSchema object, {
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
    required BankExtensionSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.price = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BankExtensionSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BankExtensionSchemaBuilder();
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
