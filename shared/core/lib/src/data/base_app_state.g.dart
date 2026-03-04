// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_app_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppStateNotifier)
final appStateProvider = AppStateNotifierProvider._();

final class AppStateNotifierProvider
    extends $NotifierProvider<AppStateNotifier, BaseAppState> {
  AppStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStateNotifierHash();

  @$internal
  @override
  AppStateNotifier create() => AppStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseAppState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseAppState>(value),
    );
  }
}

String _$appStateNotifierHash() => r'0763c123792e91a631e768988ac3f3a11e7cc206';

abstract class _$AppStateNotifier extends $Notifier<BaseAppState> {
  BaseAppState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BaseAppState, BaseAppState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BaseAppState, BaseAppState>,
              BaseAppState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
