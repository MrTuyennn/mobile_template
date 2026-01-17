import 'package:flutter/foundation.dart';
import '../mixin/safety_notify_listeners.dart';

/// Abstract base class for implementing notifiers with change notification.
abstract class BaseNotifier extends ChangeNotifier with SafetyNotifyListeners {}

/// Notifier class for managing loading state and notifying listeners.
class LoadingStateNotifier extends BaseNotifier {
  bool isLoading = false;

  /// Wraps a future to handle loading state while the future is executing.
  Future<T> whileLoading<T>(Future<T> Function() future) {
    return Future.microtask(
      toLoading,
    ).then((_) => future()).whenComplete(toIdle);
  }

  void toLoading() {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
  }

  void toIdle() {
    if (!isLoading) return;
    isLoading = false;
    notifyListeners();
  }
}
