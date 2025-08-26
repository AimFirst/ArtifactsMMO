// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NPCType _$merchant = const NPCType._('merchant');
const NPCType _$trader = const NPCType._('trader');

NPCType _$valueOf(String name) {
  switch (name) {
    case 'merchant':
      return _$merchant;
    case 'trader':
      return _$trader;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<NPCType> _$values = BuiltSet<NPCType>(const <NPCType>[
  _$merchant,
  _$trader,
]);

class _$NPCTypeMeta {
  const _$NPCTypeMeta();
  NPCType get merchant => _$merchant;
  NPCType get trader => _$trader;
  NPCType valueOf(String name) => _$valueOf(name);
  BuiltSet<NPCType> get values => _$values;
}

abstract class _$NPCTypeMixin {
  // ignore: non_constant_identifier_names
  _$NPCTypeMeta get NPCType => const _$NPCTypeMeta();
}

Serializer<NPCType> _$nPCTypeSerializer = _$NPCTypeSerializer();

class _$NPCTypeSerializer implements PrimitiveSerializer<NPCType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'merchant': 'merchant',
    'trader': 'trader',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'merchant': 'merchant',
    'trader': 'trader',
  };

  @override
  final Iterable<Type> types = const <Type>[NPCType];
  @override
  final String wireName = 'NPCType';

  @override
  Object serialize(Serializers serializers, NPCType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  NPCType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NPCType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
