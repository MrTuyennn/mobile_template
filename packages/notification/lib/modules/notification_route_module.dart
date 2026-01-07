import 'package:auto_route/auto_route.dart';
import 'notification_route_module.gr.dart';

@AutoRouterConfig(generateForDir: ['lib/module', 'lib/presentation/pages'])
class NotificationRouteModule extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: NotificationRoute.page, path: '/notification'),
  ];
}
