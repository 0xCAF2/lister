// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Items)
final itemsProvider = ItemsProvider._();

final class ItemsProvider extends $NotifierProvider<Items, List<Item>> {
  ItemsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'itemsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$itemsHash();

  @$internal
  @override
  Items create() => Items();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Item> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Item>>(value),
    );
  }
}

String _$itemsHash() => r'03792485dfaf5885fd9296518c95b95107a22702';

abstract class _$Items extends $Notifier<List<Item>> {
  List<Item> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Item>, List<Item>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Item>, List<Item>>, List<Item>, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
