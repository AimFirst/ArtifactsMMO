// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_content_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MapContentType _$monster = const MapContentType._('monster');
const MapContentType _$resource = const MapContentType._('resource');
const MapContentType _$workshop = const MapContentType._('workshop');
const MapContentType _$bank = const MapContentType._('bank');
const MapContentType _$grandExchange = const MapContentType._('grandExchange');
const MapContentType _$tasksMaster = const MapContentType._('tasksMaster');
const MapContentType _$npc = const MapContentType._('npc');

MapContentType _$valueOf(String name) {
  switch (name) {
    case 'monster':
      return _$monster;
    case 'resource':
      return _$resource;
    case 'workshop':
      return _$workshop;
    case 'bank':
      return _$bank;
    case 'grandExchange':
      return _$grandExchange;
    case 'tasksMaster':
      return _$tasksMaster;
    case 'npc':
      return _$npc;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MapContentType> _$values =
    new BuiltSet<MapContentType>(const <MapContentType>[
  _$monster,
  _$resource,
  _$workshop,
  _$bank,
  _$grandExchange,
  _$tasksMaster,
  _$npc,
]);

class _$MapContentTypeMeta {
  const _$MapContentTypeMeta();
  MapContentType get monster => _$monster;
  MapContentType get resource => _$resource;
  MapContentType get workshop => _$workshop;
  MapContentType get bank => _$bank;
  MapContentType get grandExchange => _$grandExchange;
  MapContentType get tasksMaster => _$tasksMaster;
  MapContentType get npc => _$npc;
  MapContentType valueOf(String name) => _$valueOf(name);
  BuiltSet<MapContentType> get values => _$values;
}

abstract class _$MapContentTypeMixin {
  // ignore: non_constant_identifier_names
  _$MapContentTypeMeta get MapContentType => const _$MapContentTypeMeta();
}

Serializer<MapContentType> _$mapContentTypeSerializer =
    new _$MapContentTypeSerializer();

class _$MapContentTypeSerializer
    implements PrimitiveSerializer<MapContentType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'monster': 'monster',
    'resource': 'resource',
    'workshop': 'workshop',
    'bank': 'bank',
    'grandExchange': 'grand_exchange',
    'tasksMaster': 'tasks_master',
    'npc': 'npc',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'monster': 'monster',
    'resource': 'resource',
    'workshop': 'workshop',
    'bank': 'bank',
    'grand_exchange': 'grandExchange',
    'tasks_master': 'tasksMaster',
    'npc': 'npc',
  };

  @override
  final Iterable<Type> types = const <Type>[MapContentType];
  @override
  final String wireName = 'MapContentType';

  @override
  Object serialize(Serializers serializers, MapContentType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  MapContentType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MapContentType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
