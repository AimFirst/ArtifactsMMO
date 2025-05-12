//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:artifacts_api/src/serializers.dart';
import 'package:artifacts_api/src/auth/api_key_auth.dart';
import 'package:artifacts_api/src/auth/basic_auth.dart';
import 'package:artifacts_api/src/auth/bearer_auth.dart';
import 'package:artifacts_api/src/auth/oauth.dart';
import 'package:artifacts_api/src/api/accounts_api.dart';
import 'package:artifacts_api/src/api/achievements_api.dart';
import 'package:artifacts_api/src/api/badges_api.dart';
import 'package:artifacts_api/src/api/characters_api.dart';
import 'package:artifacts_api/src/api/default_api.dart';
import 'package:artifacts_api/src/api/effects_api.dart';
import 'package:artifacts_api/src/api/events_api.dart';
import 'package:artifacts_api/src/api/grand_exchange_api.dart';
import 'package:artifacts_api/src/api/items_api.dart';
import 'package:artifacts_api/src/api/leaderboard_api.dart';
import 'package:artifacts_api/src/api/maps_api.dart';
import 'package:artifacts_api/src/api/monsters_api.dart';
import 'package:artifacts_api/src/api/my_account_api.dart';
import 'package:artifacts_api/src/api/my_characters_api.dart';
import 'package:artifacts_api/src/api/npcs_api.dart';
import 'package:artifacts_api/src/api/resources_api.dart';
import 'package:artifacts_api/src/api/tasks_api.dart';
import 'package:artifacts_api/src/api/token_api.dart';

class ArtifactsApi {
  static const String basePath = r'http://localhost';

  final Dio dio;
  final Serializers serializers;

  ArtifactsApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
              as OAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
              as BearerAuthInterceptor)
          .tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this
                  .dio
                  .interceptors
                  .firstWhere((element) => element is ApiKeyAuthInterceptor)
              as ApiKeyAuthInterceptor)
          .apiKeys[name] = apiKey;
    }
  }

  /// Get AccountsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AccountsApi getAccountsApi() {
    return AccountsApi(dio, serializers);
  }

  /// Get AchievementsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AchievementsApi getAchievementsApi() {
    return AchievementsApi(dio, serializers);
  }

  /// Get BadgesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BadgesApi getBadgesApi() {
    return BadgesApi(dio, serializers);
  }

  /// Get CharactersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CharactersApi getCharactersApi() {
    return CharactersApi(dio, serializers);
  }

  /// Get DefaultApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DefaultApi getDefaultApi() {
    return DefaultApi(dio, serializers);
  }

  /// Get EffectsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EffectsApi getEffectsApi() {
    return EffectsApi(dio, serializers);
  }

  /// Get EventsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EventsApi getEventsApi() {
    return EventsApi(dio, serializers);
  }

  /// Get GrandExchangeApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GrandExchangeApi getGrandExchangeApi() {
    return GrandExchangeApi(dio, serializers);
  }

  /// Get ItemsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ItemsApi getItemsApi() {
    return ItemsApi(dio, serializers);
  }

  /// Get LeaderboardApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  LeaderboardApi getLeaderboardApi() {
    return LeaderboardApi(dio, serializers);
  }

  /// Get MapsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MapsApi getMapsApi() {
    return MapsApi(dio, serializers);
  }

  /// Get MonstersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MonstersApi getMonstersApi() {
    return MonstersApi(dio, serializers);
  }

  /// Get MyAccountApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MyAccountApi getMyAccountApi() {
    return MyAccountApi(dio, serializers);
  }

  /// Get MyCharactersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MyCharactersApi getMyCharactersApi() {
    return MyCharactersApi(dio, serializers);
  }

  /// Get NPCsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NPCsApi getNPCsApi() {
    return NPCsApi(dio, serializers);
  }

  /// Get ResourcesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ResourcesApi getResourcesApi() {
    return ResourcesApi(dio, serializers);
  }

  /// Get TasksApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TasksApi getTasksApi() {
    return TasksApi(dio, serializers);
  }

  /// Get TokenApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TokenApi getTokenApi() {
    return TokenApi(dio, serializers);
  }
}
