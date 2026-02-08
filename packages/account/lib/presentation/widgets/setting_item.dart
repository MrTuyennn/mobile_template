import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.theme.appColors;
    return Container(
      decoration: BoxDecoration(
        color: appColors.borderSubTitle,
        borderRadius: BorderRadius.circular(AppDimens.md),
      ),
      padding: EdgeInsets.all(AppDimens.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: AppDimens.lg,
            children: [
              Icon(
                Icons.settings,
                size: AppDimens.sxl,
                color: appColors.textDisabled,
              ),
              Text('Wallet'),
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
