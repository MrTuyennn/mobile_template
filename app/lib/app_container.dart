import 'package:app/routers/auth_route_guard.dart';
import 'package:app/routers/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:theme/theme.dart';

class AppContainer extends HookConsumerWidget {
  const AppContainer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useMemoized(
      () => AppRouter(authRouteGuard: AuthRouteGuard(ref: ref)),
    );
    return MaterialApp.router(
      theme: AppTheme.light(isTablet: false).themeData,
      darkTheme: AppTheme.dark(isTablet: false).themeData,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      themeMode: ThemeMode.light,
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: router.delegate(),
    );
  }
}
