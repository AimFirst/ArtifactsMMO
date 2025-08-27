// lib/services/api_client.dart

// Import the generated Dio instance and the Api class
import 'package:artifacts_api/artifacts_api.dart';
import 'package:artifacts_mmo/providers/log_provider.dart';
import 'package:artifacts_mmo/services/logger_service.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final ArtifactsApi _api;

  // Getter to expose the generated api classes
  // e.g., to access character-related endpoints
  CharactersApi get character => _api.getCharactersApi();
  MyCharactersApi get myCharacters => _api.getMyCharactersApi();
  MapsApi get maps => _api.getMapsApi();
  ResourcesApi get resources => _api.getResourcesApi();
  MyAccountApi get myAccount => _api.getMyAccountApi();
  // Add other getters for other API groups as needed, e.g., market, crafting, etc.
  // MarketApi get market => _api.getMarketApi();

  ApiClient(String bearerToken)
      : _api = ArtifactsApi(
    basePathOverride: 'https://api.artifactsmmo.com',
    dio: _createDioClient(bearerToken),
  );

  // Private method to create and configure a Dio instance
  static Dio _createDioClient(String bearerToken) {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.artifactsmmo.com',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ));

    // Add an interceptor to inject the Authorization header into every request
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $bearerToken';
          return handler.next(options); // Continue with the request
        },
        onError: (error, handler) {
          // You can add global error handling here
          LoggerService.instance.log("API Client Error: ${error.message}", level: LogLevel.error);
          return handler.next(error);
        },
      ),
    );

    return dio;
  }
}