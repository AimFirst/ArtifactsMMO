// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AccountStatus _$standard = const AccountStatus._('standard');
const AccountStatus _$founder = const AccountStatus._('founder');
const AccountStatus _$goldFounder = const AccountStatus._('goldFounder');
const AccountStatus _$vipFounder = const AccountStatus._('vipFounder');

AccountStatus _$valueOf(String name) {
  switch (name) {
    case 'standard':
      return _$standard;
    case 'founder':
      return _$founder;
    case 'goldFounder':
      return _$goldFounder;
    case 'vipFounder':
      return _$vipFounder;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AccountStatus> _$values =
    new BuiltSet<AccountStatus>(const <AccountStatus>[
  _$standard,
  _$founder,
  _$goldFounder,
  _$vipFounder,
]);

class _$AccountStatusMeta {
  const _$AccountStatusMeta();
  AccountStatus get standard => _$standard;
  AccountStatus get founder => _$founder;
  AccountStatus get goldFounder => _$goldFounder;
  AccountStatus get vipFounder => _$vipFounder;
  AccountStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<AccountStatus> get values => _$values;
}

abstract class _$AccountStatusMixin {
  // ignore: non_constant_identifier_names
  _$AccountStatusMeta get AccountStatus => const _$AccountStatusMeta();
}

Serializer<AccountStatus> _$accountStatusSerializer =
    new _$AccountStatusSerializer();

class _$AccountStatusSerializer implements PrimitiveSerializer<AccountStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'standard': 'standard',
    'founder': 'founder',
    'goldFounder': 'gold_founder',
    'vipFounder': 'vip_founder',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'standard': 'standard',
    'founder': 'founder',
    'gold_founder': 'goldFounder',
    'vip_founder': 'vipFounder',
  };

  @override
  final Iterable<Type> types = const <Type>[AccountStatus];
  @override
  final String wireName = 'AccountStatus';

  @override
  Object serialize(Serializers serializers, AccountStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AccountStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AccountStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
