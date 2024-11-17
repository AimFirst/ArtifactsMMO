// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'craft_skill.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CraftSkill _$weaponcrafting = const CraftSkill._('weaponcrafting');
const CraftSkill _$gearcrafting = const CraftSkill._('gearcrafting');
const CraftSkill _$jewelrycrafting = const CraftSkill._('jewelrycrafting');
const CraftSkill _$cooking = const CraftSkill._('cooking');
const CraftSkill _$woodcutting = const CraftSkill._('woodcutting');
const CraftSkill _$mining = const CraftSkill._('mining');
const CraftSkill _$alchemy = const CraftSkill._('alchemy');

CraftSkill _$valueOf(String name) {
  switch (name) {
    case 'weaponcrafting':
      return _$weaponcrafting;
    case 'gearcrafting':
      return _$gearcrafting;
    case 'jewelrycrafting':
      return _$jewelrycrafting;
    case 'cooking':
      return _$cooking;
    case 'woodcutting':
      return _$woodcutting;
    case 'mining':
      return _$mining;
    case 'alchemy':
      return _$alchemy;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CraftSkill> _$values =
    new BuiltSet<CraftSkill>(const <CraftSkill>[
  _$weaponcrafting,
  _$gearcrafting,
  _$jewelrycrafting,
  _$cooking,
  _$woodcutting,
  _$mining,
  _$alchemy,
]);

class _$CraftSkillMeta {
  const _$CraftSkillMeta();
  CraftSkill get weaponcrafting => _$weaponcrafting;
  CraftSkill get gearcrafting => _$gearcrafting;
  CraftSkill get jewelrycrafting => _$jewelrycrafting;
  CraftSkill get cooking => _$cooking;
  CraftSkill get woodcutting => _$woodcutting;
  CraftSkill get mining => _$mining;
  CraftSkill get alchemy => _$alchemy;
  CraftSkill valueOf(String name) => _$valueOf(name);
  BuiltSet<CraftSkill> get values => _$values;
}

abstract class _$CraftSkillMixin {
  // ignore: non_constant_identifier_names
  _$CraftSkillMeta get CraftSkill => const _$CraftSkillMeta();
}

Serializer<CraftSkill> _$craftSkillSerializer = new _$CraftSkillSerializer();

class _$CraftSkillSerializer implements PrimitiveSerializer<CraftSkill> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'weaponcrafting': 'weaponcrafting',
    'gearcrafting': 'gearcrafting',
    'jewelrycrafting': 'jewelrycrafting',
    'cooking': 'cooking',
    'woodcutting': 'woodcutting',
    'mining': 'mining',
    'alchemy': 'alchemy',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'weaponcrafting': 'weaponcrafting',
    'gearcrafting': 'gearcrafting',
    'jewelrycrafting': 'jewelrycrafting',
    'cooking': 'cooking',
    'woodcutting': 'woodcutting',
    'mining': 'mining',
    'alchemy': 'alchemy',
  };

  @override
  final Iterable<Type> types = const <Type>[CraftSkill];
  @override
  final String wireName = 'CraftSkill';

  @override
  Object serialize(Serializers serializers, CraftSkill object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CraftSkill deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CraftSkill.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
