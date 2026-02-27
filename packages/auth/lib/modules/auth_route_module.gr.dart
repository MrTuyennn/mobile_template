// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth/presentation/pages/login_page.dart' as _i1;
import 'package:auth/presentation/pages/register_page.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i3.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i4.Key? key,
    required _i1.LoginCallback onLogin,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, onLogin: onLogin),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i1.LoginPage(key: args.key, onLogin: args.onLogin);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.onLogin});

  final _i4.Key? key;

  final _i1.LoginCallback onLogin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLogin: $onLogin}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key && onLogin == other.onLogin;
  }

  @override
  int get hashCode => key.hashCode ^ onLogin.hashCode;
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i3.PageRouteInfo<void> {
  const RegisterRoute({List<_i3.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.RegisterPage();
    },
  );
}
