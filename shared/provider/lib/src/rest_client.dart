// ignore_for_file: unused_field

import 'package:core/core.dart';
import 'package:riverpod/riverpod.dart';

final restClientProvider = Provider<RestClientProvider>((ref) {
  return ({options}) {
    return RestClient(ref, options: options);
  };
});

final class RestClient extends IRestClient {
  RestClient(this._ref, {super.options});

  ///
  final Ref _ref;

  @override
  IRestClientOptions get defaultOptions => IRestClientOptions(
    baseUrl: 'https://dogapi.dog/api/v2',
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    contentType: 'application/json; charset=utf-8',
    headers: {
      // 'Language': _ref.read(
      //   appSettingProvider.select((value) => value.locale.languageCode),
      // ),
      // 'package_name': Env.of().appId,
    },
    validateStatus: (status) {
      if (status == null) return false;
      return status >= 200 && status < 400;
    },
  );
}
