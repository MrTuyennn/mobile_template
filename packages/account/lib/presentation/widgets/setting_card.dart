import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return Container(
      decoration: BoxDecoration(
        color: appColors.gray[200],
        borderRadius: BorderRadius.circular(AppDimens.md),
      ),
      padding: EdgeInsets.all(AppDimens.slg),
      child: child,
    );
  }
}
