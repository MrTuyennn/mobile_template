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
        AccountHeader(
          onPressNotification: () {
            final tabsRouter = AutoTabsRouter.of(context);
            tabsRouter.setActiveIndex(1);
          },
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(AppDimens.slg),
            child: Column(
              spacing: AppDimens.md,
              children: [
                SettingCard(child: SettingItem(title: '')),
                SettingCard(
                  child: Column(
                    spacing: AppDimens.lg,
                    children: [
                      SettingItem(title: '1'),
                      SettingItem(title: '2'),
                      SettingItem(title: '3'),
                      SettingItem(title: '4'),
                      SettingItem(title: '5'),
                    ],
                  ),
                ),
                SettingCard(
                  child: Column(
                    spacing: AppDimens.lg,
                    children: [
                      SettingItem(title: '6'),
                      SettingItem(title: '7'),
                      SettingItem(title: '8'),
                      SettingItem(title: '9'),
                      SettingItem(title: '10'),
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
