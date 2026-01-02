import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

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
  Widget build(BuildContext context) {
    final theme = context.theme;
    final appColros = theme.appColors;
    final appTextTheme = theme.appTextTheme;
    return MaterialApp(
      theme: AppTheme.light(isTablet: false).themeData,
      darkTheme: AppTheme.dark(isTablet: false).themeData,
      themeMode: ThemeMode.light,
      home: Material(
        child: Container(
          alignment: .center,
          child: Text(
            "tuyennnnn",
            style: appTextTheme.largeTitle.copyWith(color: appColros.active),
          ),
        ),
      ),
    );
  }
}
