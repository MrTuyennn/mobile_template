import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, this.icon, this.title});

  final IconData? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: AppDimens.lg,
          children: [
            Icon(
              icon ?? Icons.settings,
              size: AppDimens.sxl,
              color: appColors.textDisabled,
            ),
            Text(title ?? 'setting item'),
          ],
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: AppDimens.sxl,
          color: appColors.textDisabled,
        ),
      ],
    );
  }
}
