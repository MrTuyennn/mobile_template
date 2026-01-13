import 'package:core/src/remote/rest_interceptors_client.dart';
import 'package:dio/dio.dart';

typedef IRestClientOptions = BaseOptions;

class IBaseRestClient with DioMixin, RestInterceptorsClient implements Dio {
  IBaseRestClient({IRestClientOptions? options}) {
    this.options = options ?? defaultOptions;
    super.interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequest,
        onResponse: onResponse,
        onError: onError,
      ),
    );
  }

  IRestClientOptions get defaultOptions => IRestClientOptions(
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    contentType: 'application/json; charset=utf-8',
  );
}
