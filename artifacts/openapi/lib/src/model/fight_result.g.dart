// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fight_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FightResult _$win = const FightResult._('win');
const FightResult _$loss = const FightResult._('loss');

FightResult _$valueOf(String name) {
  switch (name) {
    case 'win':
      return _$win;
    case 'loss':
      return _$loss;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<FightResult> _$values =
    new BuiltSet<FightResult>(const <FightResult>[
  _$win,
  _$loss,
]);

class _$FightResultMeta {
  const _$FightResultMeta();
  FightResult get win => _$win;
  FightResult get loss => _$loss;
  FightResult valueOf(String name) => _$valueOf(name);
  BuiltSet<FightResult> get values => _$values;
}

abstract class _$FightResultMixin {
  // ignore: non_constant_identifier_names
  _$FightResultMeta get FightResult => const _$FightResultMeta();
}

Serializer<FightResult> _$fightResultSerializer = new _$FightResultSerializer();

class _$FightResultSerializer implements PrimitiveSerializer<FightResult> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'win': 'win',
    'loss': 'loss',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'win': 'win',
    'loss': 'loss',
  };

  @override
  final Iterable<Type> types = const <Type>[FightResult];
  @override
  final String wireName = 'FightResult';

  @override
  Object serialize(Serializers serializers, FightResult object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FightResult deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FightResult.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
