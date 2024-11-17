// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_leaderboard_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CharacterLeaderboardType _$combat =
    const CharacterLeaderboardType._('combat');
const CharacterLeaderboardType _$woodcutting =
    const CharacterLeaderboardType._('woodcutting');
const CharacterLeaderboardType _$mining =
    const CharacterLeaderboardType._('mining');
const CharacterLeaderboardType _$fishing =
    const CharacterLeaderboardType._('fishing');
const CharacterLeaderboardType _$weaponcrafting =
    const CharacterLeaderboardType._('weaponcrafting');
const CharacterLeaderboardType _$gearcrafting =
    const CharacterLeaderboardType._('gearcrafting');
const CharacterLeaderboardType _$jewelrycrafting =
    const CharacterLeaderboardType._('jewelrycrafting');
const CharacterLeaderboardType _$cooking =
    const CharacterLeaderboardType._('cooking');
const CharacterLeaderboardType _$alchemy =
    const CharacterLeaderboardType._('alchemy');
const CharacterLeaderboardType _$gold =
    const CharacterLeaderboardType._('gold');

CharacterLeaderboardType _$valueOf(String name) {
  switch (name) {
    case 'combat':
      return _$combat;
    case 'woodcutting':
      return _$woodcutting;
    case 'mining':
      return _$mining;
    case 'fishing':
      return _$fishing;
    case 'weaponcrafting':
      return _$weaponcrafting;
    case 'gearcrafting':
      return _$gearcrafting;
    case 'jewelrycrafting':
      return _$jewelrycrafting;
    case 'cooking':
      return _$cooking;
    case 'alchemy':
      return _$alchemy;
    case 'gold':
      return _$gold;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CharacterLeaderboardType> _$values =
    new BuiltSet<CharacterLeaderboardType>(const <CharacterLeaderboardType>[
  _$combat,
  _$woodcutting,
  _$mining,
  _$fishing,
  _$weaponcrafting,
  _$gearcrafting,
  _$jewelrycrafting,
  _$cooking,
  _$alchemy,
  _$gold,
]);

class _$CharacterLeaderboardTypeMeta {
  const _$CharacterLeaderboardTypeMeta();
  CharacterLeaderboardType get combat => _$combat;
  CharacterLeaderboardType get woodcutting => _$woodcutting;
  CharacterLeaderboardType get mining => _$mining;
  CharacterLeaderboardType get fishing => _$fishing;
  CharacterLeaderboardType get weaponcrafting => _$weaponcrafting;
  CharacterLeaderboardType get gearcrafting => _$gearcrafting;
  CharacterLeaderboardType get jewelrycrafting => _$jewelrycrafting;
  CharacterLeaderboardType get cooking => _$cooking;
  CharacterLeaderboardType get alchemy => _$alchemy;
  CharacterLeaderboardType get gold => _$gold;
  CharacterLeaderboardType valueOf(String name) => _$valueOf(name);
  BuiltSet<CharacterLeaderboardType> get values => _$values;
}

abstract class _$CharacterLeaderboardTypeMixin {
  // ignore: non_constant_identifier_names
  _$CharacterLeaderboardTypeMeta get CharacterLeaderboardType =>
      const _$CharacterLeaderboardTypeMeta();
}

Serializer<CharacterLeaderboardType> _$characterLeaderboardTypeSerializer =
    new _$CharacterLeaderboardTypeSerializer();

class _$CharacterLeaderboardTypeSerializer
    implements PrimitiveSerializer<CharacterLeaderboardType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'combat': 'combat',
    'woodcutting': 'woodcutting',
    'mining': 'mining',
    'fishing': 'fishing',
    'weaponcrafting': 'weaponcrafting',
    'gearcrafting': 'gearcrafting',
    'jewelrycrafting': 'jewelrycrafting',
    'cooking': 'cooking',
    'alchemy': 'alchemy',
    'gold': 'gold',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'combat': 'combat',
    'woodcutting': 'woodcutting',
    'mining': 'mining',
    'fishing': 'fishing',
    'weaponcrafting': 'weaponcrafting',
    'gearcrafting': 'gearcrafting',
    'jewelrycrafting': 'jewelrycrafting',
    'cooking': 'cooking',
    'alchemy': 'alchemy',
    'gold': 'gold',
  };

  @override
  final Iterable<Type> types = const <Type>[CharacterLeaderboardType];
  @override
  final String wireName = 'CharacterLeaderboardType';

  @override
  Object serialize(Serializers serializers, CharacterLeaderboardType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CharacterLeaderboardType deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CharacterLeaderboardType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
