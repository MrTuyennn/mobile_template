import 'package:account/module/account_route_module.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home/module/home_route_module.gr.dart';
import 'package:notification/modules/notification_route_module.gr.dart';

import '../widgets/navigation_bar.dart';
import '../widgets/navigation_bar_item.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const routes = [HomeRoute(), NotificationRoute(), AccountRoute()];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: routes,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final index = tabsRouter.activeIndex;

        final navBars = [
          NavigationBarItem(
            label: 'Home',
            icon: Icons.home,
            isActive: routes[index].routeName == HomeRoute.name,
          ),
          NavigationBarItem(
            label: 'Notification',
            icon: Icons.notifications_active,
            isActive: routes[index].routeName == NotificationRoute.name,
          ),
          NavigationBarItem(
            label: 'Account',
            icon: Icons.account_circle_sharp,
            isActive: routes[index].routeName == AccountRoute.name,
          ),
        ];

        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBarCustom(
            navBars: navBars,
            onChange: (i) {
              tabsRouter.setActiveIndex(i);
            },
          ),
        );
      },
    );
  }
}
