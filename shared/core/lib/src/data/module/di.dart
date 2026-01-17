import 'package:core/core.dart';
import 'package:riverpod/riverpod.dart';
import '../remote/rest_interceptors_client.dart';

final restClientProvider = Provider<RestClientProvider>((ref) {
  return ({options}) {
    return RestClient(ref, options: options);
  };
});

final class RestClient extends IRestClient {
  RestClient(this._ref, {super.options}) {
    final interceptor = _ref.read(restInterceptorsClient(this));
    interceptors.add(interceptor);
  }

  final Ref _ref;

  @override
  IRestClientOptions get defaultOptions => IRestClientOptions(
    baseUrl: '',
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    contentType: 'application/json; charset=utf-8',
  );
}
