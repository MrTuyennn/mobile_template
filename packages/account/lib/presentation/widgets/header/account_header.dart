import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:theme/theme.dart';

import '../paint/bottom_arc_clipper.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final appColors = theme.appColors;
    final l10n = L10n.of(context);
    return ClipPath(
      clipper: BottomArcClipper(radius: AppDimens.slg),
      child: Container(
        padding: EdgeInsets.only(bottom: AppDimens.slg, top: kToolbarHeight),
        color: appColors.black,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(AppDimens.md),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(AppDimens.xxl),
                  ),
                ),
                Spacer(),
                Text(
                  l10n?.account ?? '',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: appColors.white,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(AppDimens.md),
                  decoration: BoxDecoration(
                    color: appColors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(AppDimens.xxl),
                  ),
                  child: Icon(
                    Icons.notifications_active,
                    color: appColors.white,
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2020/04/25/09/52/onepiece-5090120_1280.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 24,
                    height: 24,
                    padding: EdgeInsets.all(AppDimens.sm),
                    decoration: BoxDecoration(
                      color: appColors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: appColors.white, width: 1),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: appColors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: AppDimens.sm),
              child: Column(
                children: [
                  Text(
                    'nguyenngoctuyen188@gmail.com',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: appColors.white,
                    ),
                  ),
                  Text(
                    'Ryan Nguyen',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: appColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
