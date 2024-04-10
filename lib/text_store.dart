import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'text_store.g.dart';

@riverpod
class TextStore extends _$TextStore {
  @override
  FutureOr<String> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('text') ?? '';
  }

  Future<void> save(String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('text', text);
  }
}
