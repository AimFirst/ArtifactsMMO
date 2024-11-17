//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:artifacts_api/src/model/account_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_leaderboard_schema.g.dart';

/// AccountLeaderboardSchema
///
/// Properties:
/// * [position] - Position in the leaderboard.
/// * [account] - Account name.
/// * [status] - Member status.
/// * [achievementsPoints] - Achievements points.
@BuiltValue()
abstract class AccountLeaderboardSchema
    implements
        Built<AccountLeaderboardSchema, AccountLeaderboardSchemaBuilder> {
  /// Position in the leaderboard.
  @BuiltValueField(wireName: r'position')
  int get position;

  /// Account name.
  @BuiltValueField(wireName: r'account')
  String get account;

  /// Member status.
  @BuiltValueField(wireName: r'status')
  AccountStatus get status;
  // enum statusEnum {  standard,  founder,  gold_founder,  vip_founder,  };

  /// Achievements points.
  @BuiltValueField(wireName: r'achievements_points')
  int get achievementsPoints;

  AccountLeaderboardSchema._();

  factory AccountLeaderboardSchema(
          [void updates(AccountLeaderboardSchemaBuilder b)]) =
      _$AccountLeaderboardSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountLeaderboardSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountLeaderboardSchema> get serializer =>
      _$AccountLeaderboardSchemaSerializer();
}

class _$AccountLeaderboardSchemaSerializer
    implements PrimitiveSerializer<AccountLeaderboardSchema> {
  @override
  final Iterable<Type> types = const [
    AccountLeaderboardSchema,
    _$AccountLeaderboardSchema
  ];

  @override
  final String wireName = r'AccountLeaderboardSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountLeaderboardSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'position';
    yield serializers.serialize(
      object.position,
      specifiedType: const FullType(int),
    );
    yield r'account';
    yield serializers.serialize(
      object.account,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(AccountStatus),
    );
    yield r'achievements_points';
    yield serializers.serialize(
      object.achievementsPoints,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AccountLeaderboardSchema object, {
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
    required AccountLeaderboardSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.position = valueDes;
          break;
        case r'account':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.account = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AccountStatus),
          ) as AccountStatus;
          result.status = valueDes;
          break;
        case r'achievements_points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.achievementsPoints = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AccountLeaderboardSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountLeaderboardSchemaBuilder();
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
