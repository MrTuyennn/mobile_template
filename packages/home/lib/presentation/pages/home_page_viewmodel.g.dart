// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomePageViewmodel)
final homePageViewmodelProvider = HomePageViewmodelProvider._();

final class HomePageViewmodelProvider
    extends $NotifierProvider<HomePageViewmodel, HomePageState> {
  HomePageViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homePageViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homePageViewmodelHash();

  @$internal
  @override
  HomePageViewmodel create() => HomePageViewmodel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomePageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomePageState>(value),
    );
  }
}

String _$homePageViewmodelHash() => r'd06333b60a0e8566dbb5aa9fa4c52ba319cd4db0';

abstract class _$HomePageViewmodel extends $Notifier<HomePageState> {
  HomePageState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<HomePageState, HomePageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomePageState, HomePageState>,
              HomePageState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
