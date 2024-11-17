// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_skin.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CharacterSkin _$men1 = const CharacterSkin._('men1');
const CharacterSkin _$men2 = const CharacterSkin._('men2');
const CharacterSkin _$men3 = const CharacterSkin._('men3');
const CharacterSkin _$women1 = const CharacterSkin._('women1');
const CharacterSkin _$women2 = const CharacterSkin._('women2');
const CharacterSkin _$women3 = const CharacterSkin._('women3');

CharacterSkin _$valueOf(String name) {
  switch (name) {
    case 'men1':
      return _$men1;
    case 'men2':
      return _$men2;
    case 'men3':
      return _$men3;
    case 'women1':
      return _$women1;
    case 'women2':
      return _$women2;
    case 'women3':
      return _$women3;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CharacterSkin> _$values =
    new BuiltSet<CharacterSkin>(const <CharacterSkin>[
  _$men1,
  _$men2,
  _$men3,
  _$women1,
  _$women2,
  _$women3,
]);

class _$CharacterSkinMeta {
  const _$CharacterSkinMeta();
  CharacterSkin get men1 => _$men1;
  CharacterSkin get men2 => _$men2;
  CharacterSkin get men3 => _$men3;
  CharacterSkin get women1 => _$women1;
  CharacterSkin get women2 => _$women2;
  CharacterSkin get women3 => _$women3;
  CharacterSkin valueOf(String name) => _$valueOf(name);
  BuiltSet<CharacterSkin> get values => _$values;
}

abstract class _$CharacterSkinMixin {
  // ignore: non_constant_identifier_names
  _$CharacterSkinMeta get CharacterSkin => const _$CharacterSkinMeta();
}

Serializer<CharacterSkin> _$characterSkinSerializer =
    new _$CharacterSkinSerializer();

class _$CharacterSkinSerializer implements PrimitiveSerializer<CharacterSkin> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'men1': 'men1',
    'men2': 'men2',
    'men3': 'men3',
    'women1': 'women1',
    'women2': 'women2',
    'women3': 'women3',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'men1': 'men1',
    'men2': 'men2',
    'men3': 'men3',
    'women1': 'women1',
    'women2': 'women2',
    'women3': 'women3',
  };

  @override
  final Iterable<Type> types = const <Type>[CharacterSkin];
  @override
  final String wireName = 'CharacterSkin';

  @override
  Object serialize(Serializers serializers, CharacterSkin object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CharacterSkin deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CharacterSkin.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
