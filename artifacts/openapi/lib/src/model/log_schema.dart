//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/log_type.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'log_schema.g.dart';

/// LogSchema
///
/// Properties:
/// * [character] - Character name.
/// * [account] - Account character.
/// * [type] - Type of action.
/// * [description] - Description of action.
/// * [content]
/// * [cooldown] - Cooldown in seconds.
/// * [cooldownExpiration]
/// * [createdAt] - Datetime of creation.
@BuiltValue()
abstract class LogSchema implements Built<LogSchema, LogSchemaBuilder> {
  /// Character name.
  @BuiltValueField(wireName: r'character')
  String get character;

  /// Account character.
  @BuiltValueField(wireName: r'account')
  String get account;

  /// Type of action.
  @BuiltValueField(wireName: r'type')
  LogType get type;
  // enum typeEnum {  spawn,  movement,  fight,  crafting,  gathering,  buy_ge,  sell_ge,  cancel_ge,  delete_item,  deposit,  withdraw,  deposit_gold,  withdraw_gold,  equip,  unequip,  new_task,  task_exchange,  task_cancelled,  task_completed,  task_trade,  recycling,  rest,  use,  buy_bank_expansion,  achievement,  };

  /// Description of action.
  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'content')
  JsonObject? get content;

  /// Cooldown in seconds.
  @BuiltValueField(wireName: r'cooldown')
  int get cooldown;

  @BuiltValueField(wireName: r'cooldown_expiration')
  DateTime? get cooldownExpiration;

  /// Datetime of creation.
  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  LogSchema._();

  factory LogSchema([void updates(LogSchemaBuilder b)]) = _$LogSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LogSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LogSchema> get serializer => _$LogSchemaSerializer();
}

class _$LogSchemaSerializer implements PrimitiveSerializer<LogSchema> {
  @override
  final Iterable<Type> types = const [LogSchema, _$LogSchema];

  @override
  final String wireName = r'LogSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LogSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'character';
    yield serializers.serialize(
      object.character,
      specifiedType: const FullType(String),
    );
    yield r'account';
    yield serializers.serialize(
      object.account,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(LogType),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'content';
    yield object.content == null
        ? null
        : serializers.serialize(
            object.content,
            specifiedType: const FullType.nullable(JsonObject),
          );
    yield r'cooldown';
    yield serializers.serialize(
      object.cooldown,
      specifiedType: const FullType(int),
    );
    yield r'cooldown_expiration';
    yield object.cooldownExpiration == null
        ? null
        : serializers.serialize(
            object.cooldownExpiration,
            specifiedType: const FullType.nullable(DateTime),
          );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LogSchema object, {
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
    required LogSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'character':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.character = valueDes;
          break;
        case r'account':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.account = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(LogType),
          ) as LogType;
          result.type = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.content = valueDes;
          break;
        case r'cooldown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.cooldown = valueDes;
          break;
        case r'cooldown_expiration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.cooldownExpiration = valueDes;
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
  LogSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LogSchemaBuilder();
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
