//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/npc_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'npc_schema.g.dart';

/// NPCSchema
///
/// Properties:
/// * [name] - Name of the NPC.
/// * [code] - The code of the NPC. This is the NPC's unique identifier (ID).
/// * [description] - Description of the NPC.
/// * [type] - Type of the NPC.
@BuiltValue()
abstract class NPCSchema implements Built<NPCSchema, NPCSchemaBuilder> {
  /// Name of the NPC.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// The code of the NPC. This is the NPC's unique identifier (ID).
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Description of the NPC.
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Type of the NPC.
  @BuiltValueField(wireName: r'type')
  NPCType get type;
  // enum typeEnum {  merchant,  };

  NPCSchema._();

  factory NPCSchema([void updates(NPCSchemaBuilder b)]) = _$NPCSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NPCSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NPCSchema> get serializer => _$NPCSchemaSerializer();
}

class _$NPCSchemaSerializer implements PrimitiveSerializer<NPCSchema> {
  @override
  final Iterable<Type> types = const [NPCSchema, _$NPCSchema];

  @override
  final String wireName = r'NPCSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NPCSchema object, {
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
      specifiedType: const FullType(NPCType),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NPCSchema object, {
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
    required NPCSchemaBuilder result,
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
            specifiedType: const FullType(NPCType),
          ) as NPCType;
          result.type = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NPCSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NPCSchemaBuilder();
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
