// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(prefs)
final prefsProvider = PrefsProvider._();

final class PrefsProvider extends $FunctionalProvider<
        AsyncValue<SharedPreferencesWithCache>,
        SharedPreferencesWithCache,
        FutureOr<SharedPreferencesWithCache>>
    with
        $FutureModifier<SharedPreferencesWithCache>,
        $FutureProvider<SharedPreferencesWithCache> {
  PrefsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'prefsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$prefsHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferencesWithCache> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferencesWithCache> create(Ref ref) {
    return prefs(ref);
  }
}

String _$prefsHash() => r'9e0a6f2545842a84e037af768bb403992c65b14b';
