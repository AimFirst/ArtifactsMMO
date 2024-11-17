//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'drop_rate_schema.g.dart';

/// DropRateSchema
///
/// Properties:
/// * [code] - Item code.
/// * [rate] - Chance rate. (1/rate)
/// * [minQuantity] - Minimum quantity.
/// * [maxQuantity] - Maximum quantity.
@BuiltValue()
abstract class DropRateSchema
    implements Built<DropRateSchema, DropRateSchemaBuilder> {
  /// Item code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Chance rate. (1/rate)
  @BuiltValueField(wireName: r'rate')
  int get rate;

  /// Minimum quantity.
  @BuiltValueField(wireName: r'min_quantity')
  int get minQuantity;

  /// Maximum quantity.
  @BuiltValueField(wireName: r'max_quantity')
  int get maxQuantity;

  DropRateSchema._();

  factory DropRateSchema([void updates(DropRateSchemaBuilder b)]) =
      _$DropRateSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DropRateSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DropRateSchema> get serializer =>
      _$DropRateSchemaSerializer();
}

class _$DropRateSchemaSerializer
    implements PrimitiveSerializer<DropRateSchema> {
  @override
  final Iterable<Type> types = const [DropRateSchema, _$DropRateSchema];

  @override
  final String wireName = r'DropRateSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DropRateSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'rate';
    yield serializers.serialize(
      object.rate,
      specifiedType: const FullType(int),
    );
    yield r'min_quantity';
    yield serializers.serialize(
      object.minQuantity,
      specifiedType: const FullType(int),
    );
    yield r'max_quantity';
    yield serializers.serialize(
      object.maxQuantity,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DropRateSchema object, {
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
    required DropRateSchemaBuilder result,
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
        case r'rate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.rate = valueDes;
          break;
        case r'min_quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.minQuantity = valueDes;
          break;
        case r'max_quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxQuantity = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DropRateSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DropRateSchemaBuilder();
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
