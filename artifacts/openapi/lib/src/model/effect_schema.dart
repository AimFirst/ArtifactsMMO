//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/effect_type.dart';
import 'package:artifacts_api/src/model/effect_subtype.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'effect_schema.g.dart';

/// EffectSchema
///
/// Properties:
/// * [name] - Name of the effect.
/// * [code] - The code of the effect. This is the effect's unique identifier (ID).
/// * [description] - Description of the effect. This is a brief description of the effect.
/// * [type] - Type of the effect.
/// * [subtype] - Subtype of the effect.
@BuiltValue()
abstract class EffectSchema
    implements Built<EffectSchema, EffectSchemaBuilder> {
  /// Name of the effect.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// The code of the effect. This is the effect's unique identifier (ID).
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Description of the effect. This is a brief description of the effect.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Type of the effect.
  @BuiltValueField(wireName: r'type')
  EffectType get type;
  // enum typeEnum {  equipment,  consumable,  combat,  };

  /// Subtype of the effect.
  @BuiltValueField(wireName: r'subtype')
  EffectSubtype get subtype;
  // enum subtypeEnum {  stat,  other,  heal,  buff,  debuff,  special,  gathering,  teleport,  gold,  };

  EffectSchema._();

  factory EffectSchema([void updates(EffectSchemaBuilder b)]) = _$EffectSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EffectSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EffectSchema> get serializer => _$EffectSchemaSerializer();
}

class _$EffectSchemaSerializer implements PrimitiveSerializer<EffectSchema> {
  @override
  final Iterable<Type> types = const [EffectSchema, _$EffectSchema];

  @override
  final String wireName = r'EffectSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EffectSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
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
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(EffectType),
    );
    yield r'subtype';
    yield serializers.serialize(
      object.subtype,
      specifiedType: const FullType(EffectSubtype),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EffectSchema object, {
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
    required EffectSchemaBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EffectType),
          ) as EffectType;
          result.type = valueDes;
          break;
        case r'subtype':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EffectSubtype),
          ) as EffectSubtype;
          result.subtype = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EffectSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EffectSchemaBuilder();
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
