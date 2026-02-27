import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';

typedef LoginCallback = Future<bool> Function(String email, String password);

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onLogin});

  final LoginCallback onLogin;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return Material(
      child: Center(
        child: GestureDetector(
          onTap: () async {
            await widget.onLogin('nguyennngoctuyen188@gmail.com', '123456');
          },
          child: Container(
            height: 100,
            width: 100,
            color: Colors.amber,
            child: Text(l10n?.hello ?? ''),
          ),
        ),
      ),
    );
  }
}
