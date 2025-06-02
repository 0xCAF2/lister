import 'package:lister/prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_store.g.dart';

@riverpod
class TextStore extends _$TextStore {
  @override
  String build() {
    final prefs = ref.watch(prefsProvider).requireValue;
    return prefs.getString('text') ?? '';
  }

  Future<void> save(String text) async {
    final prefs = ref.read(prefsProvider).requireValue;
    await prefs.setString('text', text);
  }
}
