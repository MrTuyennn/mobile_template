import 'dart:io';

import 'package:app_logger/logger.dart';
import 'package:core/src/remote/token/itoken_service.dart';
import 'package:core/src/remote/token/token_service.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

final restInterceptorsClient = Provider.family<RestInterceptorsClient, Dio>((
  ref,
  dio,
) {
  final tokenService = ref.read(tokenServiceProvider(dio));
  return RestInterceptorsClient(dio, tokenService);
});

final class RestInterceptorsClient extends Interceptor {
  RestInterceptorsClient(this._dio, this._tokenService);

  final Dio _dio;
  final ItokenService _tokenService;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
    final accessToken = await _tokenService.getAccessToken();
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logger.d(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final token = await _tokenService.getRefreshToken();

      try {
        /// refresh token request - api call
        final result = await _tokenService.refreshToken(token);

        final accesToken = result.data.accessToken;
        final refreshToken = result.data.refreshToken;

        // save new access token and refresh token to secure storage
        await _tokenService.saveToken(accesToken, refreshToken);

        final options = err.requestOptions;

        // update request headers with new access token
        options.headers['Authorization'] = 'Bearer $accesToken';
        // repeat the request with new access token
        return handler.resolve(await _dio.fetch(options));
      } on DioException catch (e) {
        if (e.response?.statusCode == 498) {
          // remove access token and refresh token from secure storage
          await _tokenService.clearToken();

          return handler.next(err);
        }

        // continue with the error
        return handler.next(err);
      }
    }
    // continue with the error
    return handler.next(err);
  }
}
