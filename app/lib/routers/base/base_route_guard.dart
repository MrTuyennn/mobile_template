import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseRouteGuard extends AutoRouteGuard {
  const BaseRouteGuard({required this.ref});
  final WidgetRef ref;
}
