// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect_subtype.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EffectSubtype _$stat = const EffectSubtype._('stat');
const EffectSubtype _$other = const EffectSubtype._('other');
const EffectSubtype _$heal = const EffectSubtype._('heal');
const EffectSubtype _$buff = const EffectSubtype._('buff');
const EffectSubtype _$debuff = const EffectSubtype._('debuff');
const EffectSubtype _$special = const EffectSubtype._('special');
const EffectSubtype _$gathering = const EffectSubtype._('gathering');
const EffectSubtype _$teleport = const EffectSubtype._('teleport');
const EffectSubtype _$gold = const EffectSubtype._('gold');

EffectSubtype _$valueOf(String name) {
  switch (name) {
    case 'stat':
      return _$stat;
    case 'other':
      return _$other;
    case 'heal':
      return _$heal;
    case 'buff':
      return _$buff;
    case 'debuff':
      return _$debuff;
    case 'special':
      return _$special;
    case 'gathering':
      return _$gathering;
    case 'teleport':
      return _$teleport;
    case 'gold':
      return _$gold;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EffectSubtype> _$values =
    new BuiltSet<EffectSubtype>(const <EffectSubtype>[
  _$stat,
  _$other,
  _$heal,
  _$buff,
  _$debuff,
  _$special,
  _$gathering,
  _$teleport,
  _$gold,
]);

class _$EffectSubtypeMeta {
  const _$EffectSubtypeMeta();
  EffectSubtype get stat => _$stat;
  EffectSubtype get other => _$other;
  EffectSubtype get heal => _$heal;
  EffectSubtype get buff => _$buff;
  EffectSubtype get debuff => _$debuff;
  EffectSubtype get special => _$special;
  EffectSubtype get gathering => _$gathering;
  EffectSubtype get teleport => _$teleport;
  EffectSubtype get gold => _$gold;
  EffectSubtype valueOf(String name) => _$valueOf(name);
  BuiltSet<EffectSubtype> get values => _$values;
}

abstract class _$EffectSubtypeMixin {
  // ignore: non_constant_identifier_names
  _$EffectSubtypeMeta get EffectSubtype => const _$EffectSubtypeMeta();
}

Serializer<EffectSubtype> _$effectSubtypeSerializer =
    new _$EffectSubtypeSerializer();

class _$EffectSubtypeSerializer implements PrimitiveSerializer<EffectSubtype> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'stat': 'stat',
    'other': 'other',
    'heal': 'heal',
    'buff': 'buff',
    'debuff': 'debuff',
    'special': 'special',
    'gathering': 'gathering',
    'teleport': 'teleport',
    'gold': 'gold',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'stat': 'stat',
    'other': 'other',
    'heal': 'heal',
    'buff': 'buff',
    'debuff': 'debuff',
    'special': 'special',
    'gathering': 'gathering',
    'teleport': 'teleport',
    'gold': 'gold',
  };

  @override
  final Iterable<Type> types = const <Type>[EffectSubtype];
  @override
  final String wireName = 'EffectSubtype';

  @override
  Object serialize(Serializers serializers, EffectSubtype object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EffectSubtype deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EffectSubtype.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
