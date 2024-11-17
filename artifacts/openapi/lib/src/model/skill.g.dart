// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Skill _$weaponcrafting = const Skill._('weaponcrafting');
const Skill _$gearcrafting = const Skill._('gearcrafting');
const Skill _$jewelrycrafting = const Skill._('jewelrycrafting');
const Skill _$cooking = const Skill._('cooking');
const Skill _$woodcutting = const Skill._('woodcutting');
const Skill _$mining = const Skill._('mining');
const Skill _$alchemy = const Skill._('alchemy');
const Skill _$fishing = const Skill._('fishing');

Skill _$valueOf(String name) {
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
    case 'fishing':
      return _$fishing;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Skill> _$values = new BuiltSet<Skill>(const <Skill>[
  _$weaponcrafting,
  _$gearcrafting,
  _$jewelrycrafting,
  _$cooking,
  _$woodcutting,
  _$mining,
  _$alchemy,
  _$fishing,
]);

class _$SkillMeta {
  const _$SkillMeta();
  Skill get weaponcrafting => _$weaponcrafting;
  Skill get gearcrafting => _$gearcrafting;
  Skill get jewelrycrafting => _$jewelrycrafting;
  Skill get cooking => _$cooking;
  Skill get woodcutting => _$woodcutting;
  Skill get mining => _$mining;
  Skill get alchemy => _$alchemy;
  Skill get fishing => _$fishing;
  Skill valueOf(String name) => _$valueOf(name);
  BuiltSet<Skill> get values => _$values;
}

abstract class _$SkillMixin {
  // ignore: non_constant_identifier_names
  _$SkillMeta get Skill => const _$SkillMeta();
}

Serializer<Skill> _$skillSerializer = new _$SkillSerializer();

class _$SkillSerializer implements PrimitiveSerializer<Skill> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'weaponcrafting': 'weaponcrafting',
    'gearcrafting': 'gearcrafting',
    'jewelrycrafting': 'jewelrycrafting',
    'cooking': 'cooking',
    'woodcutting': 'woodcutting',
    'mining': 'mining',
    'alchemy': 'alchemy',
    'fishing': 'fishing',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'weaponcrafting': 'weaponcrafting',
    'gearcrafting': 'gearcrafting',
    'jewelrycrafting': 'jewelrycrafting',
    'cooking': 'cooking',
    'woodcutting': 'woodcutting',
    'mining': 'mining',
    'alchemy': 'alchemy',
    'fishing': 'fishing',
  };

  @override
  final Iterable<Type> types = const <Type>[Skill];
  @override
  final String wireName = 'Skill';

  @override
  Object serialize(Serializers serializers, Skill object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  Skill deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Skill.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
