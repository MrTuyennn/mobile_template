import 'package:core/src/foundation/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

LoadingStateNotifier useLoadingState() {
  return use(_LoadingStateHook());
}

class _LoadingStateHook extends Hook<LoadingStateNotifier> {
  const _LoadingStateHook();
  @override
  _LoadingStateHookState createState() => _LoadingStateHookState();
}

class _LoadingStateHookState
    extends HookState<LoadingStateNotifier, _LoadingStateHook> {
  final loadingState = LoadingStateNotifier();

  @override
  LoadingStateNotifier build(BuildContext context) {
    return loadingState;
  }

  @override
  void dispose() {
    loadingState.dispose();
    super.dispose();
  }
}
