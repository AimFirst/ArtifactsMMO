//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'map_content_type.g.dart';

class MapContentType extends EnumClass {
  @BuiltValueEnumConst(wireName: r'monster')
  static const MapContentType monster = _$monster;
  @BuiltValueEnumConst(wireName: r'resource')
  static const MapContentType resource = _$resource;
  @BuiltValueEnumConst(wireName: r'workshop')
  static const MapContentType workshop = _$workshop;
  @BuiltValueEnumConst(wireName: r'bank')
  static const MapContentType bank = _$bank;
  @BuiltValueEnumConst(wireName: r'grand_exchange')
  static const MapContentType grandExchange = _$grandExchange;
  @BuiltValueEnumConst(wireName: r'tasks_master')
  static const MapContentType tasksMaster = _$tasksMaster;
  @BuiltValueEnumConst(wireName: r'npc')
  static const MapContentType npc = _$npc;

  static Serializer<MapContentType> get serializer =>
      _$mapContentTypeSerializer;

  const MapContentType._(String name) : super(name);

  static BuiltSet<MapContentType> get values => _$values;
  static MapContentType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class MapContentTypeMixin = Object with _$MapContentTypeMixin;
