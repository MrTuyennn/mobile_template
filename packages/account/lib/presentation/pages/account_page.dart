import 'package:account/presentation/widgets/setting_card.dart';
import 'package:account/presentation/widgets/setting_item.dart';
import 'package:app_logger/logger.dart';
import 'package:auto_route/auto_route.dart';
import 'package:device_info_app/device_info_app.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

import '../widgets/header/account_header.dart';

@RoutePage()
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Future<void> _getAppInfo() async {
    final deviceInfo = await DeviceInfoApp.getDeviceInfo();
    logger.e(deviceInfo!.toJson());
  }

  @override
  void initState() {
    super.initState();
    _getAppInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountHeader(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(AppDimens.slg),
            child: Column(
              spacing: AppDimens.md,
              children: [
                SettingCard(child: SettingItem()),
                SettingCard(
                  child: Column(
                    spacing: AppDimens.lg,
                    children: [
                      SettingItem(),
                      SettingItem(),
                      SettingItem(),
                      SettingItem(),
                      SettingItem(),
                    ],
                  ),
                ),
                SettingCard(
                  child: Column(
                    spacing: AppDimens.lg,
                    children: [
                      SettingItem(),
                      SettingItem(),
                      SettingItem(),
                      SettingItem(),
                      SettingItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
