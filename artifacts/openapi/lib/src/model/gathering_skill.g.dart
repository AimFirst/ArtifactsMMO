// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gathering_skill.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GatheringSkill _$mining = const GatheringSkill._('mining');
const GatheringSkill _$woodcutting = const GatheringSkill._('woodcutting');
const GatheringSkill _$fishing = const GatheringSkill._('fishing');
const GatheringSkill _$alchemy = const GatheringSkill._('alchemy');

GatheringSkill _$valueOf(String name) {
  switch (name) {
    case 'mining':
      return _$mining;
    case 'woodcutting':
      return _$woodcutting;
    case 'fishing':
      return _$fishing;
    case 'alchemy':
      return _$alchemy;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GatheringSkill> _$values =
    new BuiltSet<GatheringSkill>(const <GatheringSkill>[
  _$mining,
  _$woodcutting,
  _$fishing,
  _$alchemy,
]);

class _$GatheringSkillMeta {
  const _$GatheringSkillMeta();
  GatheringSkill get mining => _$mining;
  GatheringSkill get woodcutting => _$woodcutting;
  GatheringSkill get fishing => _$fishing;
  GatheringSkill get alchemy => _$alchemy;
  GatheringSkill valueOf(String name) => _$valueOf(name);
  BuiltSet<GatheringSkill> get values => _$values;
}

abstract class _$GatheringSkillMixin {
  // ignore: non_constant_identifier_names
  _$GatheringSkillMeta get GatheringSkill => const _$GatheringSkillMeta();
}

Serializer<GatheringSkill> _$gatheringSkillSerializer =
    new _$GatheringSkillSerializer();

class _$GatheringSkillSerializer
    implements PrimitiveSerializer<GatheringSkill> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'mining': 'mining',
    'woodcutting': 'woodcutting',
    'fishing': 'fishing',
    'alchemy': 'alchemy',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'mining': 'mining',
    'woodcutting': 'woodcutting',
    'fishing': 'fishing',
    'alchemy': 'alchemy',
  };

  @override
  final Iterable<Type> types = const <Type>[GatheringSkill];
  @override
  final String wireName = 'GatheringSkill';

  @override
  Object serialize(Serializers serializers, GatheringSkill object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  GatheringSkill deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GatheringSkill.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
