import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DogDetailPage extends HookConsumerWidget {
  const DogDetailPage({super.key, @PathParam() this.id = ''});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(child: Center(child: Text('$id ------ tuyen'))),
    );
  }
}
