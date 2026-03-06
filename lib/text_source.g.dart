// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TextSource)
final textSourceProvider = TextSourceProvider._();

final class TextSourceProvider extends $NotifierProvider<TextSource, String> {
  TextSourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'textSourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$textSourceHash();

  @$internal
  @override
  TextSource create() => TextSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$textSourceHash() => r'88b835fca4563a18372fca814aa38a5d1865b5fd';

abstract class _$TextSource extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
