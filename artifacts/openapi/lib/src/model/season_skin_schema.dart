//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'season_skin_schema.g.dart';

/// SeasonSkinSchema
///
/// Properties:
/// * [code] - Skin code.
/// * [description] - Skin description.
/// * [requiredPoints] - Required achievement points to earn the skin.
@BuiltValue()
abstract class SeasonSkinSchema
    implements Built<SeasonSkinSchema, SeasonSkinSchemaBuilder> {
  /// Skin code.
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Skin description.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Required achievement points to earn the skin.
  @BuiltValueField(wireName: r'required_points')
  int get requiredPoints;

  SeasonSkinSchema._();

  factory SeasonSkinSchema([void updates(SeasonSkinSchemaBuilder b)]) =
      _$SeasonSkinSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SeasonSkinSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SeasonSkinSchema> get serializer =>
      _$SeasonSkinSchemaSerializer();
}

class _$SeasonSkinSchemaSerializer
    implements PrimitiveSerializer<SeasonSkinSchema> {
  @override
  final Iterable<Type> types = const [SeasonSkinSchema, _$SeasonSkinSchema];

  @override
  final String wireName = r'SeasonSkinSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SeasonSkinSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'code';
    yield serializers.serialize(
      object.code,
      specifiedType: const FullType(String),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'required_points';
    yield serializers.serialize(
      object.requiredPoints,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SeasonSkinSchema object, {
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
    required SeasonSkinSchemaBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'required_points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.requiredPoints = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SeasonSkinSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SeasonSkinSchemaBuilder();
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
