import 'package:dio/dio.dart';

typedef IRestClientOptions = BaseOptions;
typedef IInterceptors = Interceptors;

class IBaseRestClient with DioMixin implements Dio {
  IBaseRestClient({
    IRestClientOptions? options,
    List<Interceptor>? interceptors,
  }) {
    this.options = options ?? defaultOptions;
    if (interceptors != null) {
      this.interceptors.addAll(interceptors);
    }
  }

  IRestClientOptions get defaultOptions => IRestClientOptions(
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    contentType: 'application/json; charset=utf-8',
  );
}
