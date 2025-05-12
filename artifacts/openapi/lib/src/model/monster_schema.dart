//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/simple_effect_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/drop_rate_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'monster_schema.g.dart';

/// MonsterSchema
///
/// Properties:
/// * [name] - Name of the monster.
/// * [code] - The code of the monster. This is the monster's unique identifier (ID).
/// * [level] - Monster level.
/// * [hp] - Monster hit points.
/// * [attackFire] - Monster fire attack.
/// * [attackEarth] - Monster earth attack.
/// * [attackWater] - Monster water attack.
/// * [attackAir] - Monster air attack.
/// * [resFire] - Monster % fire resistance.
/// * [resEarth] - Monster % earth resistance.
/// * [resWater] - Monster % water resistance.
/// * [resAir] - Monster % air resistance.
/// * [criticalStrike] - Monster % critical strike.
/// * [minGold] - Monster minimum gold drop.
/// * [maxGold] - Monster maximum gold drop.
/// * [drops] - Monster drops. This is a list of items that the monster drops after killing the monster.
/// * [effects] - List of effects.
@BuiltValue()
abstract class MonsterSchema
    implements Built<MonsterSchema, MonsterSchemaBuilder> {
  /// Name of the monster.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// The code of the monster. This is the monster's unique identifier (ID).
  @BuiltValueField(wireName: r'code')
  String get code;

  /// Monster level.
  @BuiltValueField(wireName: r'level')
  int get level;

  /// Monster hit points.
  @BuiltValueField(wireName: r'hp')
  int get hp;

  /// Monster fire attack.
  @BuiltValueField(wireName: r'attack_fire')
  int get attackFire;

  /// Monster earth attack.
  @BuiltValueField(wireName: r'attack_earth')
  int get attackEarth;

  /// Monster water attack.
  @BuiltValueField(wireName: r'attack_water')
  int get attackWater;

  /// Monster air attack.
  @BuiltValueField(wireName: r'attack_air')
  int get attackAir;

  /// Monster % fire resistance.
  @BuiltValueField(wireName: r'res_fire')
  int get resFire;

  /// Monster % earth resistance.
  @BuiltValueField(wireName: r'res_earth')
  int get resEarth;

  /// Monster % water resistance.
  @BuiltValueField(wireName: r'res_water')
  int get resWater;

  /// Monster % air resistance.
  @BuiltValueField(wireName: r'res_air')
  int get resAir;

  /// Monster % critical strike.
  @BuiltValueField(wireName: r'critical_strike')
  int get criticalStrike;

  /// Monster minimum gold drop.
  @BuiltValueField(wireName: r'min_gold')
  int get minGold;

  /// Monster maximum gold drop.
  @BuiltValueField(wireName: r'max_gold')
  int get maxGold;

  /// Monster drops. This is a list of items that the monster drops after killing the monster.
  @BuiltValueField(wireName: r'drops')
  BuiltList<DropRateSchema> get drops;

  /// List of effects.
  @BuiltValueField(wireName: r'effects')
  BuiltList<SimpleEffectSchema>? get effects;

  MonsterSchema._();

  factory MonsterSchema([void updates(MonsterSchemaBuilder b)]) =
      _$MonsterSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MonsterSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MonsterSchema> get serializer =>
      _$MonsterSchemaSerializer();
}

class _$MonsterSchemaSerializer implements PrimitiveSerializer<MonsterSchema> {
  @override
  final Iterable<Type> types = const [MonsterSchema, _$MonsterSchema];

  @override
  final String wireName = r'MonsterSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MonsterSchema object, {
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
    yield r'level';
    yield serializers.serialize(
      object.level,
      specifiedType: const FullType(int),
    );
    yield r'hp';
    yield serializers.serialize(
      object.hp,
      specifiedType: const FullType(int),
    );
    yield r'attack_fire';
    yield serializers.serialize(
      object.attackFire,
      specifiedType: const FullType(int),
    );
    yield r'attack_earth';
    yield serializers.serialize(
      object.attackEarth,
      specifiedType: const FullType(int),
    );
    yield r'attack_water';
    yield serializers.serialize(
      object.attackWater,
      specifiedType: const FullType(int),
    );
    yield r'attack_air';
    yield serializers.serialize(
      object.attackAir,
      specifiedType: const FullType(int),
    );
    yield r'res_fire';
    yield serializers.serialize(
      object.resFire,
      specifiedType: const FullType(int),
    );
    yield r'res_earth';
    yield serializers.serialize(
      object.resEarth,
      specifiedType: const FullType(int),
    );
    yield r'res_water';
    yield serializers.serialize(
      object.resWater,
      specifiedType: const FullType(int),
    );
    yield r'res_air';
    yield serializers.serialize(
      object.resAir,
      specifiedType: const FullType(int),
    );
    yield r'critical_strike';
    yield serializers.serialize(
      object.criticalStrike,
      specifiedType: const FullType(int),
    );
    yield r'min_gold';
    yield serializers.serialize(
      object.minGold,
      specifiedType: const FullType(int),
    );
    yield r'max_gold';
    yield serializers.serialize(
      object.maxGold,
      specifiedType: const FullType(int),
    );
    yield r'drops';
    yield serializers.serialize(
      object.drops,
      specifiedType: const FullType(BuiltList, [FullType(DropRateSchema)]),
    );
    if (object.effects != null) {
      yield r'effects';
      yield serializers.serialize(
        object.effects,
        specifiedType:
            const FullType(BuiltList, [FullType(SimpleEffectSchema)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MonsterSchema object, {
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
    required MonsterSchemaBuilder result,
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
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.level = valueDes;
          break;
        case r'hp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.hp = valueDes;
          break;
        case r'attack_fire':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attackFire = valueDes;
          break;
        case r'attack_earth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attackEarth = valueDes;
          break;
        case r'attack_water':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attackWater = valueDes;
          break;
        case r'attack_air':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.attackAir = valueDes;
          break;
        case r'res_fire':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.resFire = valueDes;
          break;
        case r'res_earth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.resEarth = valueDes;
          break;
        case r'res_water':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.resWater = valueDes;
          break;
        case r'res_air':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.resAir = valueDes;
          break;
        case r'critical_strike':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.criticalStrike = valueDes;
          break;
        case r'min_gold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.minGold = valueDes;
          break;
        case r'max_gold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxGold = valueDes;
          break;
        case r'drops':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(DropRateSchema)]),
          ) as BuiltList<DropRateSchema>;
          result.drops.replace(valueDes);
          break;
        case r'effects':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(SimpleEffectSchema)]),
          ) as BuiltList<SimpleEffectSchema>;
          result.effects.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MonsterSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MonsterSchemaBuilder();
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
