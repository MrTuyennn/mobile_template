import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'base_app_state.g.dart';

class BaseAppState {
  const BaseAppState({
    this.isAuthencation = false,
    this.locale = const Locale('en', 'UK'),
  });
  final bool isAuthencation;
  final Locale locale;

  BaseAppState copyWith({bool? isAuthencation, Locale? locale}) {
    return BaseAppState(
      isAuthencation: isAuthencation ?? this.isAuthencation,
      locale: locale ?? this.locale,
    );
  }
}

@Riverpod(keepAlive: true)
class AppStateNotifier extends _$AppStateNotifier {
  Future<void> setAuthenticated(bool isAuth) async {
    state = state.copyWith(isAuthencation: isAuth);
  }

  Future<void> changeLanguage(Locale locale) async {
    state = state.copyWith(locale: locale);
  }

  @override
  BaseAppState build() {
    return BaseAppState();
  }
}
