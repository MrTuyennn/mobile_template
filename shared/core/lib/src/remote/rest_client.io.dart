import 'package:dio/io.dart';
import 'rest_client.dart';

export 'package:dio/dio.dart' hide BaseOptions;

typedef RestClientProvider =
    IRestClient Function({IRestClientOptions? options});

class IRestClient extends IBaseRestClient {
  IRestClient({super.options}) {
    httpClientAdapter = IOHttpClientAdapter();
  }
}
