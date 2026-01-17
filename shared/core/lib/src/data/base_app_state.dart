import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'base_app_state.g.dart';

class BaseAppState {
  const BaseAppState({this.isAuthencation = false});
  final bool isAuthencation;

  BaseAppState copyWith({bool? isAuthencation}) {
    return BaseAppState(isAuthencation: isAuthencation ?? this.isAuthencation);
  }
}

@Riverpod(keepAlive: true)
class AppStateNotifier extends _$AppStateNotifier {
  Future<void> setAuthenticated(bool isAuth) async {
    state = state.copyWith(isAuthencation: isAuth);
  }

  @override
  BaseAppState build() {
    return BaseAppState();
  }
}
