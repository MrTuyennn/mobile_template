import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, this.icon, this.title, this.onPress});

  final IconData? icon;
  final String? title;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return GestureDetector(
      onTap: onPress,
      child: Row(
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
      ),
    );
  }
}
