// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_operator.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConditionOperator _$eq = const ConditionOperator._('eq');
const ConditionOperator _$ne = const ConditionOperator._('ne');
const ConditionOperator _$gt = const ConditionOperator._('gt');
const ConditionOperator _$lt = const ConditionOperator._('lt');

ConditionOperator _$valueOf(String name) {
  switch (name) {
    case 'eq':
      return _$eq;
    case 'ne':
      return _$ne;
    case 'gt':
      return _$gt;
    case 'lt':
      return _$lt;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConditionOperator> _$values =
    BuiltSet<ConditionOperator>(const <ConditionOperator>[
  _$eq,
  _$ne,
  _$gt,
  _$lt,
]);

class _$ConditionOperatorMeta {
  const _$ConditionOperatorMeta();
  ConditionOperator get eq => _$eq;
  ConditionOperator get ne => _$ne;
  ConditionOperator get gt => _$gt;
  ConditionOperator get lt => _$lt;
  ConditionOperator valueOf(String name) => _$valueOf(name);
  BuiltSet<ConditionOperator> get values => _$values;
}

abstract class _$ConditionOperatorMixin {
  // ignore: non_constant_identifier_names
  _$ConditionOperatorMeta get ConditionOperator =>
      const _$ConditionOperatorMeta();
}

Serializer<ConditionOperator> _$conditionOperatorSerializer =
    _$ConditionOperatorSerializer();

class _$ConditionOperatorSerializer
    implements PrimitiveSerializer<ConditionOperator> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'eq': 'eq',
    'ne': 'ne',
    'gt': 'gt',
    'lt': 'lt',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'eq': 'eq',
    'ne': 'ne',
    'gt': 'gt',
    'lt': 'lt',
  };

  @override
  final Iterable<Type> types = const <Type>[ConditionOperator];
  @override
  final String wireName = 'ConditionOperator';

  @override
  Object serialize(Serializers serializers, ConditionOperator object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ConditionOperator deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ConditionOperator.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
