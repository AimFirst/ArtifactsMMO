//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'announcement_schema.g.dart';

/// AnnouncementSchema
///
/// Properties:
/// * [message] - Announcement text.
/// * [createdAt] - Datetime of the announcement.
@BuiltValue()
abstract class AnnouncementSchema
    implements Built<AnnouncementSchema, AnnouncementSchemaBuilder> {
  /// Announcement text.
  @BuiltValueField(wireName: r'message')
  String get message;

  /// Datetime of the announcement.
  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  AnnouncementSchema._();

  factory AnnouncementSchema([void updates(AnnouncementSchemaBuilder b)]) =
      _$AnnouncementSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnnouncementSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnnouncementSchema> get serializer =>
      _$AnnouncementSchemaSerializer();
}

class _$AnnouncementSchemaSerializer
    implements PrimitiveSerializer<AnnouncementSchema> {
  @override
  final Iterable<Type> types = const [AnnouncementSchema, _$AnnouncementSchema];

  @override
  final String wireName = r'AnnouncementSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnnouncementSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'message';
    yield serializers.serialize(
      object.message,
      specifiedType: const FullType(String),
    );
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AnnouncementSchema object, {
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
    required AnnouncementSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnnouncementSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnnouncementSchemaBuilder();
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
