//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:artifacts_api/src/model/account_status.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_details.g.dart';

/// AccountDetails
///
/// Properties:
/// * [username] - Username.
/// * [subscribed] - Subscribed for the current season.
/// * [status] - Member status.
/// * [achievementsPoints] - Achievement points.
/// * [banned] - Banned.
/// * [badges] - Account badges.
/// * [banReason] - Ban reason.
@BuiltValue()
abstract class AccountDetails
    implements Built<AccountDetails, AccountDetailsBuilder> {
  /// Username.
  @BuiltValueField(wireName: r'username')
  String get username;

  /// Subscribed for the current season.
  @BuiltValueField(wireName: r'subscribed')
  bool get subscribed;

  /// Member status.
  @BuiltValueField(wireName: r'status')
  AccountStatus get status;
  // enum statusEnum {  standard,  founder,  gold_founder,  vip_founder,  };

  /// Achievement points.
  @BuiltValueField(wireName: r'achievements_points')
  int get achievementsPoints;

  /// Banned.
  @BuiltValueField(wireName: r'banned')
  bool get banned;

  /// Account badges.
  @BuiltValueField(wireName: r'badges')
  BuiltList<JsonObject?>? get badges;

  /// Ban reason.
  @BuiltValueField(wireName: r'ban_reason')
  String? get banReason;

  AccountDetails._();

  factory AccountDetails([void updates(AccountDetailsBuilder b)]) =
      _$AccountDetails;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountDetailsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountDetails> get serializer =>
      _$AccountDetailsSerializer();
}

class _$AccountDetailsSerializer
    implements PrimitiveSerializer<AccountDetails> {
  @override
  final Iterable<Type> types = const [AccountDetails, _$AccountDetails];

  @override
  final String wireName = r'AccountDetails';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
    yield r'subscribed';
    yield serializers.serialize(
      object.subscribed,
      specifiedType: const FullType(bool),
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
    yield r'banned';
    yield serializers.serialize(
      object.banned,
      specifiedType: const FullType(bool),
    );
    if (object.badges != null) {
      yield r'badges';
      yield serializers.serialize(
        object.badges,
        specifiedType:
            const FullType(BuiltList, [FullType.nullable(JsonObject)]),
      );
    }
    if (object.banReason != null) {
      yield r'ban_reason';
      yield serializers.serialize(
        object.banReason,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AccountDetails object, {
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
    required AccountDetailsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        case r'subscribed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.subscribed = valueDes;
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
        case r'banned':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.banned = valueDes;
          break;
        case r'badges':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType.nullable(JsonObject)]),
          ) as BuiltList<JsonObject?>;
          result.badges.replace(valueDes);
          break;
        case r'ban_reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.banReason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AccountDetails deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountDetailsBuilder();
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
