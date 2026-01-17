import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

StackRouter useRouter({BuildContext? currentContext}) {
  final context = currentContext ?? useContext();
  return AutoRouter.of(context);
}
