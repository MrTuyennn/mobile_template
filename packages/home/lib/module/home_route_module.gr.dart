// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:home/presentation/pages/dog_detail_page.dart' as _i1;
import 'package:home/presentation/pages/home_page.dart' as _i2;

/// generated route for
/// [_i1.DogDetailPage]
class DogDetailRoute extends _i3.PageRouteInfo<DogDetailRouteArgs> {
  DogDetailRoute({
    _i4.Key? key,
    String id = '',
    List<_i3.PageRouteInfo>? children,
  }) : super(
         DogDetailRoute.name,
         args: DogDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'DogDetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<DogDetailRouteArgs>(
        orElse: () => DogDetailRouteArgs(id: pathParams.getString('id', '')),
      );
      return _i1.DogDetailPage(key: args.key, id: args.id);
    },
  );
}

class DogDetailRouteArgs {
  const DogDetailRouteArgs({this.key, this.id = ''});

  final _i4.Key? key;

  final String id;

  @override
  String toString() {
    return 'DogDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DogDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}
