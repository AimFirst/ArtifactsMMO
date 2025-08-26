//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/season_badge_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/season_skin_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'season_schema.g.dart';

/// SeasonSchema
///
/// Properties:
/// * [badges] - Season badges with required achievement points.
/// * [skins] - Season skins with required achievement points.
/// * [name] - Season name.
/// * [number] - Season number.
/// * [startDate] - Season start date.
@BuiltValue()
abstract class SeasonSchema
    implements Built<SeasonSchema, SeasonSchemaBuilder> {
  /// Season badges with required achievement points.
  @BuiltValueField(wireName: r'badges')
  BuiltList<SeasonBadgeSchema> get badges;

  /// Season skins with required achievement points.
  @BuiltValueField(wireName: r'skins')
  BuiltList<SeasonSkinSchema> get skins;

  /// Season name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// Season number.
  @BuiltValueField(wireName: r'number')
  int? get number;

  /// Season start date.
  @BuiltValueField(wireName: r'start_date')
  DateTime? get startDate;

  SeasonSchema._();

  factory SeasonSchema([void updates(SeasonSchemaBuilder b)]) = _$SeasonSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SeasonSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SeasonSchema> get serializer => _$SeasonSchemaSerializer();
}

class _$SeasonSchemaSerializer implements PrimitiveSerializer<SeasonSchema> {
  @override
  final Iterable<Type> types = const [SeasonSchema, _$SeasonSchema];

  @override
  final String wireName = r'SeasonSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SeasonSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'badges';
    yield serializers.serialize(
      object.badges,
      specifiedType: const FullType(BuiltList, [FullType(SeasonBadgeSchema)]),
    );
    yield r'skins';
    yield serializers.serialize(
      object.skins,
      specifiedType: const FullType(BuiltList, [FullType(SeasonSkinSchema)]),
    );
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.number != null) {
      yield r'number';
      yield serializers.serialize(
        object.number,
        specifiedType: const FullType(int),
      );
    }
    if (object.startDate != null) {
      yield r'start_date';
      yield serializers.serialize(
        object.startDate,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SeasonSchema object, {
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
    required SeasonSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'badges':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SeasonBadgeSchema)]),
          ) as BuiltList<SeasonBadgeSchema>;
          result.badges.replace(valueDes);
          break;
        case r'skins':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SeasonSkinSchema)]),
          ) as BuiltList<SeasonSkinSchema>;
          result.skins.replace(valueDes);
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.number = valueDes;
          break;
        case r'start_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SeasonSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SeasonSchemaBuilder();
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
