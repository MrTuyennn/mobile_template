import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(generateForDir: ['lib/module', 'lib/presentation/pages'])
class MainRouteModule extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [];
}
