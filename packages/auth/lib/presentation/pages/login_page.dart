import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
          onTap: () {},
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
