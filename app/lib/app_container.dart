import 'package:app/routers/auth_route_guard.dart';
import 'package:app/routers/base/navigator_observer.dart';
import 'package:app/routers/router.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:theme/theme.dart';

class AppContainer extends HookConsumerWidget {
  const AppContainer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useLoadingState();

    Future<String> loadingState() async {
      return await loading.whileLoading(() async {
        if (!context.mounted) return 'dispose';
        return 'done';
      });
    }

    useEffect(() {
      loadingState();
      return null;
    }, []);

    final router = useMemoized(
      () => AppRouter(authRouteGuard: AuthRouteGuard(ref: ref)),
    );
    return MaterialApp.router(
      theme: AppTheme.light(isTablet: false).themeData,
      darkTheme: AppTheme.dark(isTablet: false).themeData,
      locale: Locale('vi', 'VN'),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      themeMode: ThemeMode.light,
      // routeInformationParser: router.defaultRouteParser(),
      // routerDelegate: router.delegate(),
      routerConfig: router.config(
        navigatorObservers: () => [NavigatorObserverApp()],
      ),
    );
  }
}
