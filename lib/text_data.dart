import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_data.g.dart';

@riverpod
class TextData extends _$TextData {
  @override
  String build() {
    return '';
  }

  void update(String text) {
    if (state == text) {
      return;
    }
    state = text;
  }
}
