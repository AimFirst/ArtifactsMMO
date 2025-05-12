// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EffectType _$equipment = const EffectType._('equipment');
const EffectType _$consumable = const EffectType._('consumable');
const EffectType _$combat = const EffectType._('combat');

EffectType _$valueOf(String name) {
  switch (name) {
    case 'equipment':
      return _$equipment;
    case 'consumable':
      return _$consumable;
    case 'combat':
      return _$combat;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EffectType> _$values =
    new BuiltSet<EffectType>(const <EffectType>[
  _$equipment,
  _$consumable,
  _$combat,
]);

class _$EffectTypeMeta {
  const _$EffectTypeMeta();
  EffectType get equipment => _$equipment;
  EffectType get consumable => _$consumable;
  EffectType get combat => _$combat;
  EffectType valueOf(String name) => _$valueOf(name);
  BuiltSet<EffectType> get values => _$values;
}

abstract class _$EffectTypeMixin {
  // ignore: non_constant_identifier_names
  _$EffectTypeMeta get EffectType => const _$EffectTypeMeta();
}

Serializer<EffectType> _$effectTypeSerializer = new _$EffectTypeSerializer();

class _$EffectTypeSerializer implements PrimitiveSerializer<EffectType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'equipment': 'equipment',
    'consumable': 'consumable',
    'combat': 'combat',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'equipment': 'equipment',
    'consumable': 'consumable',
    'combat': 'combat',
  };

  @override
  final Iterable<Type> types = const <Type>[EffectType];
  @override
  final String wireName = 'EffectType';

  @override
  Object serialize(Serializers serializers, EffectType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EffectType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EffectType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
