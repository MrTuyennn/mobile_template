import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:storage/storage.dart';
import './itoken_service.dart';
import './dtos/refresh_token_response.dart';

final tokenServiceProvider = Provider.family<ITokenService, Dio>((ref, dio) {
  return TokenService(dio);
});

class TokenService implements ITokenService {
  TokenService(this._dio);
  final Dio _dio;

  @override
  Future<void> clearToken() {
    final secureStorage = Storage.instance.secureStorage;
    return Future.wait([
      secureStorage.delete(key: accessTokenSecretKey),
      secureStorage.delete(key: refreshAccessTokenSecretKey),
    ]);
  }

  @override
  Future<String?> getAccessToken() async {
    final secureStorage = Storage.instance.secureStorage;
    final accessToken = await secureStorage.read(key: accessTokenSecretKey);
    return accessToken;
  }

  @override
  Future<String?> getRefreshToken() async {
    final secureStorage = Storage.instance.secureStorage;
    final refreshAccessToken = await secureStorage.read(
      key: refreshAccessTokenSecretKey,
    );
    return refreshAccessToken;
  }

  @override
  Future<RefreshTokenResponse> refreshToken(String? refreshToken) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/refresh-token',
      data: {"refreshToken": refreshToken},
    );
    if (response.statusCode == 200) {
      return RefreshTokenResponse.fromJson(response.data ?? {});
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> saveToken(String accessToken, String refreshToken) {
    final secureStorage = Storage.instance.secureStorage;
    return Future.wait([
      secureStorage.write(key: accessTokenSecretKey, value: accessToken),
      secureStorage.write(
        key: refreshAccessTokenSecretKey,
        value: refreshToken,
      ),
    ]);
  }
}
