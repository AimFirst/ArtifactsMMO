//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'simple_effect_schema.g.dart';

/// SimpleEffectSchema
///
/// Properties:
/// * [code] - Effect code.
/// * [value] - Effect value.
@BuiltValue()
abstract class SimpleEffectSchema
    implements Built<SimpleEffectSchema, SimpleEffectSchemaBuilder> {
  /// Effect code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Effect value.
  @BuiltValueField(wireName: r'value')
  int get value;

  SimpleEffectSchema._();

  factory SimpleEffectSchema([void updates(SimpleEffectSchemaBuilder b)]) =
      _$SimpleEffectSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SimpleEffectSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SimpleEffectSchema> get serializer =>
      _$SimpleEffectSchemaSerializer();
}

class _$SimpleEffectSchemaSerializer
    implements PrimitiveSerializer<SimpleEffectSchema> {
  @override
  final Iterable<Type> types = const [SimpleEffectSchema, _$SimpleEffectSchema];

  @override
  final String wireName = r'SimpleEffectSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SimpleEffectSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SimpleEffectSchema object, {
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
    required SimpleEffectSchemaBuilder result,
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
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SimpleEffectSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SimpleEffectSchemaBuilder();
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
