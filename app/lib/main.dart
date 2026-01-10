import 'dart:async';

import 'package:app/app_container.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: HookConsumer(
        builder: (context, ref, child) {
          Future<void> loadState() {
            final completer = Completer();

            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await Future.wait([
                ref.read(appStateProvider.notifier).setAuthenticated(false),
              ]);
              completer.complete();
            });
            return completer.future;
          }

          final future = useMemoized(loadState);
          final snapshot = useFuture(future);

          if (snapshot.connectionState != ConnectionState.done) {
            return Material();
          }

          return child!;
        },
        child: AppContainer(),
      ),
    ),
  );
}
