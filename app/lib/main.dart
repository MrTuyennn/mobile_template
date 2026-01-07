import 'package:app/routers/router.dart';
import 'package:app_logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:storage/storage.dart';
import 'package:theme/theme.dart';
import 'package:widget/widget.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    await Storage.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light(isTablet: false).themeData,
      darkTheme: AppTheme.dark(isTablet: false).themeData,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter().config(),
      // routeInformationParser: AppRouter().defaultRouteParser(),
      // routerDelegate: AppRouter().delegate(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final appColros = theme.appColors;
    final appTextTheme = theme.appTextTheme;
    final l10n = L10n.of(context);
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n?.hello ?? '',
            style: appTextTheme.largeTitle.copyWith(color: appColros.active),
          ),
          ActionButton.inverseBlue(
            context: context,
            wrapContent: true,
            text: 'tuyen',
            onPressed: () async {
              logger.e({
                "event": "user_login",
                "status": "success",
                "user": {
                  "id": "u_123456",
                  "email": "user@example.com",
                  "role": "member",
                },
                "device": {
                  "platform": "android",
                  "osVersion": "14",
                  "appVersion": "1.2.0",
                },
                "timestamp": "2026-01-03T20:15:30+07:00",
                "durationMs": 342,
              });
            },
          ),
        ],
      ),
    );
  }
}
