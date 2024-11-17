//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character_skin.g.dart';

class CharacterSkin extends EnumClass {
  @BuiltValueEnumConst(wireName: r'men1')
  static const CharacterSkin men1 = _$men1;
  @BuiltValueEnumConst(wireName: r'men2')
  static const CharacterSkin men2 = _$men2;
  @BuiltValueEnumConst(wireName: r'men3')
  static const CharacterSkin men3 = _$men3;
  @BuiltValueEnumConst(wireName: r'women1')
  static const CharacterSkin women1 = _$women1;
  @BuiltValueEnumConst(wireName: r'women2')
  static const CharacterSkin women2 = _$women2;
  @BuiltValueEnumConst(wireName: r'women3')
  static const CharacterSkin women3 = _$women3;

  static Serializer<CharacterSkin> get serializer => _$characterSkinSerializer;

  const CharacterSkin._(String name) : super(name);

  static BuiltSet<CharacterSkin> get values => _$values;
  static CharacterSkin valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CharacterSkinMixin = Object with _$CharacterSkinMixin;
