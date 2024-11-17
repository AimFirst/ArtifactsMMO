//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/account_leaderboard_schema.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'data_page_account_leaderboard_schema.g.dart';

/// DataPageAccountLeaderboardSchema
///
/// Properties:
/// * [data]
/// * [total]
/// * [page]
/// * [size]
/// * [pages]
@BuiltValue()
abstract class DataPageAccountLeaderboardSchema
    implements
        Built<DataPageAccountLeaderboardSchema,
            DataPageAccountLeaderboardSchemaBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<AccountLeaderboardSchema> get data;

  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'page')
  int? get page;

  @BuiltValueField(wireName: r'size')
  int? get size;

  @BuiltValueField(wireName: r'pages')
  int? get pages;

  DataPageAccountLeaderboardSchema._();

  factory DataPageAccountLeaderboardSchema(
          [void updates(DataPageAccountLeaderboardSchemaBuilder b)]) =
      _$DataPageAccountLeaderboardSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DataPageAccountLeaderboardSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DataPageAccountLeaderboardSchema> get serializer =>
      _$DataPageAccountLeaderboardSchemaSerializer();
}

class _$DataPageAccountLeaderboardSchemaSerializer
    implements PrimitiveSerializer<DataPageAccountLeaderboardSchema> {
  @override
  final Iterable<Type> types = const [
    DataPageAccountLeaderboardSchema,
    _$DataPageAccountLeaderboardSchema
  ];

  @override
  final String wireName = r'DataPageAccountLeaderboardSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DataPageAccountLeaderboardSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType:
          const FullType(BuiltList, [FullType(AccountLeaderboardSchema)]),
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
    DataPageAccountLeaderboardSchema object, {
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
    required DataPageAccountLeaderboardSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(AccountLeaderboardSchema)]),
          ) as BuiltList<AccountLeaderboardSchema>;
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
  DataPageAccountLeaderboardSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DataPageAccountLeaderboardSchemaBuilder();
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
