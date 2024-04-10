import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_source.g.dart';

@riverpod
class TextSource extends _$TextSource {
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
