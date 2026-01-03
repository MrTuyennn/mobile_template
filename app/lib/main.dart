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
    return MaterialApp(
      theme: AppTheme.light(isTablet: false).themeData,
      darkTheme: AppTheme.dark(isTablet: false).themeData,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      themeMode: ThemeMode.light,
      home: const HomePage(),
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
              await Storage.instance.vaultBox?.put('Tuyennn', 'Tuyennn');
            },
          ),
        ],
      ),
    );
  }
}
