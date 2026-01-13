import 'package:core/core.dart';
import 'package:riverpod/riverpod.dart';

/// Rest client instance
final restClientProvider = Provider<RestClientProvider>((_) {
  return IRestClient.new;
});
