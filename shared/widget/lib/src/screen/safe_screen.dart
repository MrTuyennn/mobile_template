import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SafeScreen extends StatelessWidget {
  const SafeScreen({super.key, this.background, required this.child});

  final Color? background;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return ColoredBox(
      color: background ?? appColors.black,
      child: SafeArea(child: child),
    );
  }
}
