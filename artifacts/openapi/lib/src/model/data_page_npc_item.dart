//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/npc_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'data_page_npc_item.g.dart';

/// DataPageNPCItem
///
/// Properties:
/// * [data]
/// * [total]
/// * [page]
/// * [size]
/// * [pages]
@BuiltValue()
abstract class DataPageNPCItem
    implements Built<DataPageNPCItem, DataPageNPCItemBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<NPCItem> get data;

  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'page')
  int? get page;

  @BuiltValueField(wireName: r'size')
  int? get size;

  @BuiltValueField(wireName: r'pages')
  int? get pages;

  DataPageNPCItem._();

  factory DataPageNPCItem([void updates(DataPageNPCItemBuilder b)]) =
      _$DataPageNPCItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DataPageNPCItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DataPageNPCItem> get serializer =>
      _$DataPageNPCItemSerializer();
}

class _$DataPageNPCItemSerializer
    implements PrimitiveSerializer<DataPageNPCItem> {
  @override
  final Iterable<Type> types = const [DataPageNPCItem, _$DataPageNPCItem];

  @override
  final String wireName = r'DataPageNPCItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DataPageNPCItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BuiltList, [FullType(NPCItem)]),
    );
    yield r'total';
    yield object.total == null
        ? null
        : serializers.serialize(
            object.total,
            specifiedType: const FullType.nullable(int),
          );
    yield r'page';
    yield object.page == null
        ? null
        : serializers.serialize(
            object.page,
            specifiedType: const FullType.nullable(int),
          );
    yield r'size';
    yield object.size == null
        ? null
        : serializers.serialize(
            object.size,
            specifiedType: const FullType.nullable(int),
          );
    if (object.pages != null) {
      yield r'pages';
      yield serializers.serialize(
        object.pages,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DataPageNPCItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DataPageNPCItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(NPCItem)]),
          ) as BuiltList<NPCItem>;
          result.data.replace(valueDes);
          break;
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.total = valueDes;
          break;
        case r'page':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.page = valueDes;
          break;
        case r'size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.size = valueDes;
          break;
        case r'pages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.pages = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DataPageNPCItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DataPageNPCItemBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
