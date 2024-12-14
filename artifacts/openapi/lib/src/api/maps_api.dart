//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:artifacts_api/src/api_util.dart';
import 'package:artifacts_api/src/model/data_page_map_schema.dart';
import 'package:artifacts_api/src/model/map_content_type.dart';
import 'package:artifacts_api/src/model/map_response_schema.dart';

class MapsApi {
  final Dio _dio;

  final Serializers _serializers;

  const MapsApi(this._dio, this._serializers);

  /// Get All Maps
  /// Fetch maps details.
  ///
  /// Parameters:
  /// * [contentType] - Type of content on the map.
  /// * [contentCode] - Content code on the map.
  /// * [page] - Page number
  /// * [size] - Page size
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [DataPageMapSchema] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<DataPageMapSchema>> getAllMapsMapsGet({
    MapContentType? contentType,
    String? contentCode,
    int? page = 1,
    int? size = 50,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/maps';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (contentType != null)
        r'content_type': encodeQueryParameter(
            _serializers, contentType, const FullType(MapContentType)),
      if (contentCode != null)
        r'content_code': encodeQueryParameter(
            _serializers, contentCode, const FullType(String)),
      if (page != null)
        r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (size != null)
        r'size': encodeQueryParameter(_serializers, size, const FullType(int)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    DataPageMapSchema? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(DataPageMapSchema),
            ) as DataPageMapSchema;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<DataPageMapSchema>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get Map
  /// Retrieve the details of a map.
  ///
  /// Parameters:
  /// * [x] - The position x of the map.
  /// * [y] - The position X of the map.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [MapResponseSchema] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<MapResponseSchema>> getMapMapsXYGet({
    required int x,
    required int y,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/maps/{x}/{y}'
        .replaceAll(
            '{' r'x' '}',
            encodeQueryParameter(_serializers, x, const FullType(int))
                .toString())
        .replaceAll(
            '{' r'y' '}',
            encodeQueryParameter(_serializers, y, const FullType(int))
                .toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    MapResponseSchema? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
              rawResponse,
              specifiedType: const FullType(MapResponseSchema),
            ) as MapResponseSchema;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<MapResponseSchema>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }
}
