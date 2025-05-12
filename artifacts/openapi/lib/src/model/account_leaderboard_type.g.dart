// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_leaderboard_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AccountLeaderboardType _$achievementsPoints =
    const AccountLeaderboardType._('achievementsPoints');
const AccountLeaderboardType _$gold = const AccountLeaderboardType._('gold');

AccountLeaderboardType _$valueOf(String name) {
  switch (name) {
    case 'achievementsPoints':
      return _$achievementsPoints;
    case 'gold':
      return _$gold;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AccountLeaderboardType> _$values =
    new BuiltSet<AccountLeaderboardType>(const <AccountLeaderboardType>[
  _$achievementsPoints,
  _$gold,
]);

class _$AccountLeaderboardTypeMeta {
  const _$AccountLeaderboardTypeMeta();
  AccountLeaderboardType get achievementsPoints => _$achievementsPoints;
  AccountLeaderboardType get gold => _$gold;
  AccountLeaderboardType valueOf(String name) => _$valueOf(name);
  BuiltSet<AccountLeaderboardType> get values => _$values;
}

abstract class _$AccountLeaderboardTypeMixin {
  // ignore: non_constant_identifier_names
  _$AccountLeaderboardTypeMeta get AccountLeaderboardType =>
      const _$AccountLeaderboardTypeMeta();
}

Serializer<AccountLeaderboardType> _$accountLeaderboardTypeSerializer =
    new _$AccountLeaderboardTypeSerializer();

class _$AccountLeaderboardTypeSerializer
    implements PrimitiveSerializer<AccountLeaderboardType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'achievementsPoints': 'achievements_points',
    'gold': 'gold',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'achievements_points': 'achievementsPoints',
    'gold': 'gold',
  };

  @override
  final Iterable<Type> types = const <Type>[AccountLeaderboardType];
  @override
  final String wireName = 'AccountLeaderboardType';

  @override
  Object serialize(Serializers serializers, AccountLeaderboardType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AccountLeaderboardType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AccountLeaderboardType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
