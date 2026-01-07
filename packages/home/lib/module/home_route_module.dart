import 'package:auto_route/auto_route.dart';
import 'package:home/module/home_route_module.gr.dart';

@AutoRouterConfig(generateForDir: ['lib/presentation/pages', 'lib/module'])
class HomeRouteModule extends RootStackRouter {
  HomeRouteModule();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: '/home'),
  ];
}
