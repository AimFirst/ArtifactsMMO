//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_leaderboard_type.g.dart';

class AccountLeaderboardType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'achievements_points')
  static const AccountLeaderboardType achievementsPoints = _$achievementsPoints;
  @BuiltValueEnumConst(wireName: r'gold')
  static const AccountLeaderboardType gold = _$gold;

  static Serializer<AccountLeaderboardType> get serializer =>
      _$accountLeaderboardTypeSerializer;

  const AccountLeaderboardType._(String name) : super(name);

  static BuiltSet<AccountLeaderboardType> get values => _$values;
  static AccountLeaderboardType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class AccountLeaderboardTypeMixin = Object
    with _$AccountLeaderboardTypeMixin;
