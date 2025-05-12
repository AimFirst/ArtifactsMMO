// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AchievementType _$combatKill = const AchievementType._('combatKill');
const AchievementType _$combatDrop = const AchievementType._('combatDrop');
const AchievementType _$combatLevel = const AchievementType._('combatLevel');
const AchievementType _$gathering = const AchievementType._('gathering');
const AchievementType _$crafting = const AchievementType._('crafting');
const AchievementType _$recycling = const AchievementType._('recycling');
const AchievementType _$task = const AchievementType._('task');
const AchievementType _$other = const AchievementType._('other');
const AchievementType _$use = const AchievementType._('use');

AchievementType _$valueOf(String name) {
  switch (name) {
    case 'combatKill':
      return _$combatKill;
    case 'combatDrop':
      return _$combatDrop;
    case 'combatLevel':
      return _$combatLevel;
    case 'gathering':
      return _$gathering;
    case 'crafting':
      return _$crafting;
    case 'recycling':
      return _$recycling;
    case 'task':
      return _$task;
    case 'other':
      return _$other;
    case 'use':
      return _$use;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AchievementType> _$values =
    new BuiltSet<AchievementType>(const <AchievementType>[
  _$combatKill,
  _$combatDrop,
  _$combatLevel,
  _$gathering,
  _$crafting,
  _$recycling,
  _$task,
  _$other,
  _$use,
]);

class _$AchievementTypeMeta {
  const _$AchievementTypeMeta();
  AchievementType get combatKill => _$combatKill;
  AchievementType get combatDrop => _$combatDrop;
  AchievementType get combatLevel => _$combatLevel;
  AchievementType get gathering => _$gathering;
  AchievementType get crafting => _$crafting;
  AchievementType get recycling => _$recycling;
  AchievementType get task => _$task;
  AchievementType get other => _$other;
  AchievementType get use => _$use;
  AchievementType valueOf(String name) => _$valueOf(name);
  BuiltSet<AchievementType> get values => _$values;
}

abstract class _$AchievementTypeMixin {
  // ignore: non_constant_identifier_names
  _$AchievementTypeMeta get AchievementType => const _$AchievementTypeMeta();
}

Serializer<AchievementType> _$achievementTypeSerializer =
    new _$AchievementTypeSerializer();

class _$AchievementTypeSerializer
    implements PrimitiveSerializer<AchievementType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'combatKill': 'combat_kill',
    'combatDrop': 'combat_drop',
    'combatLevel': 'combat_level',
    'gathering': 'gathering',
    'crafting': 'crafting',
    'recycling': 'recycling',
    'task': 'task',
    'other': 'other',
    'use': 'use',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'combat_kill': 'combatKill',
    'combat_drop': 'combatDrop',
    'combat_level': 'combatLevel',
    'gathering': 'gathering',
    'crafting': 'crafting',
    'recycling': 'recycling',
    'task': 'task',
    'other': 'other',
    'use': 'use',
  };

  @override
  final Iterable<Type> types = const <Type>[AchievementType];
  @override
  final String wireName = 'AchievementType';

  @override
  Object serialize(Serializers serializers, AchievementType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AchievementType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AchievementType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
