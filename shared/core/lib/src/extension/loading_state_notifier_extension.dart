import 'package:flutter_hooks/flutter_hooks.dart';

import '../foundation/foundation.dart';

extension LoadingStateNotifierX on LoadingStateNotifier {
  bool get watchIsLoading => useListenableSelector(this, () => isLoading);
}
