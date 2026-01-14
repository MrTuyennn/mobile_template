import 'package:dio/dio.dart';

typedef IRestClientOptions = BaseOptions;

class IBaseRestClient with DioMixin implements Dio {
  IBaseRestClient({IRestClientOptions? options}) {
    this.options = options ?? defaultOptions;
  }

  IRestClientOptions get defaultOptions => IRestClientOptions(
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    contentType: 'application/json; charset=utf-8',
  );
}
