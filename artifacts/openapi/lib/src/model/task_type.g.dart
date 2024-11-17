// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TaskType _$monsters = const TaskType._('monsters');
const TaskType _$items = const TaskType._('items');

TaskType _$valueOf(String name) {
  switch (name) {
    case 'monsters':
      return _$monsters;
    case 'items':
      return _$items;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TaskType> _$values = new BuiltSet<TaskType>(const <TaskType>[
  _$monsters,
  _$items,
]);

class _$TaskTypeMeta {
  const _$TaskTypeMeta();
  TaskType get monsters => _$monsters;
  TaskType get items => _$items;
  TaskType valueOf(String name) => _$valueOf(name);
  BuiltSet<TaskType> get values => _$values;
}

abstract class _$TaskTypeMixin {
  // ignore: non_constant_identifier_names
  _$TaskTypeMeta get TaskType => const _$TaskTypeMeta();
}

Serializer<TaskType> _$taskTypeSerializer = new _$TaskTypeSerializer();

class _$TaskTypeSerializer implements PrimitiveSerializer<TaskType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'monsters': 'monsters',
    'items': 'items',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'monsters': 'monsters',
    'items': 'items',
  };

  @override
  final Iterable<Type> types = const <Type>[TaskType];
  @override
  final String wireName = 'TaskType';

  @override
  Object serialize(Serializers serializers, TaskType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  TaskType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TaskType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
