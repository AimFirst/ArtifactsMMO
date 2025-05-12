//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_leaderboard_type.g.dart';

class CharacterLeaderboardType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'combat')
  static const CharacterLeaderboardType combat = _$combat;
  @BuiltValueEnumConst(wireName: r'woodcutting')
  static const CharacterLeaderboardType woodcutting = _$woodcutting;
  @BuiltValueEnumConst(wireName: r'mining')
  static const CharacterLeaderboardType mining = _$mining;
  @BuiltValueEnumConst(wireName: r'fishing')
  static const CharacterLeaderboardType fishing = _$fishing;
  @BuiltValueEnumConst(wireName: r'weaponcrafting')
  static const CharacterLeaderboardType weaponcrafting = _$weaponcrafting;
  @BuiltValueEnumConst(wireName: r'gearcrafting')
  static const CharacterLeaderboardType gearcrafting = _$gearcrafting;
  @BuiltValueEnumConst(wireName: r'jewelrycrafting')
  static const CharacterLeaderboardType jewelrycrafting = _$jewelrycrafting;
  @BuiltValueEnumConst(wireName: r'cooking')
  static const CharacterLeaderboardType cooking = _$cooking;
  @BuiltValueEnumConst(wireName: r'alchemy')
  static const CharacterLeaderboardType alchemy = _$alchemy;

  static Serializer<CharacterLeaderboardType> get serializer =>
      _$characterLeaderboardTypeSerializer;

  const CharacterLeaderboardType._(String name) : super(name);

  static BuiltSet<CharacterLeaderboardType> get values => _$values;
  static CharacterLeaderboardType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CharacterLeaderboardTypeMixin = Object
    with _$CharacterLeaderboardTypeMixin;
