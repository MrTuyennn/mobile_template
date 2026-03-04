import 'package:account/presentation/widgets/setting_card.dart';
import 'package:account/presentation/widgets/setting_item.dart';
import 'package:app_logger/logger.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:device_info_app/device_info_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:theme/theme.dart';

import '../widgets/header/account_header.dart';

@RoutePage()
class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> getAppInfo() async {
      final deviceInfo = await DeviceInfoApp.getDeviceInfo();
      logger.e(deviceInfo!.toJson());
    }

    useEffect(() {
      getAppInfo();
      return null;
    });
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
                SettingCard(
                  child: Consumer(
                    builder: (_, ref, _) {
                      final locale = ref.watch(
                        appStateProvider.select((value) => value.locale),
                      );
                      return SettingItem(
                        title: '',
                        onPress: () {
                          if (locale.languageCode == 'vi') {
                            ref
                                .watch(appStateProvider.notifier)
                                .changeLanguage(Locale('en', 'US'));
                          } else {
                            ref
                                .watch(appStateProvider.notifier)
                                .changeLanguage(Locale('vi', 'VN'));
                          }
                        },
                      );
                    },
                  ),
                ),
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
