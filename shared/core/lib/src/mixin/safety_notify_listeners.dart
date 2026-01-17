import 'package:flutter/foundation.dart';

mixin SafetyNotifyListeners on ChangeNotifier {
  bool _disposed = false;

  @mustCallSuper
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @mustCallSuper
  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
