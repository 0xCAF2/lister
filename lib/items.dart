import 'package:lister/item.dart';
import 'package:lister/text_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'items.g.dart';

@riverpod
class Items extends _$Items {
  var count = 0;

  @override
  List<Item> build() {
    final text = ref.watch(textSourceProvider);
    return parse(text);
  }

  List<Item> parse(String text) {
    final lines = text.split('\n');
    final items = <Item>[];
    for (final line in lines) {
      items.add(Item(text: line, id: count++));
    }
    return items;
  }

  void reorder(int oldIndex, int newIndex) {
    final items = state;
    final item = items.removeAt(oldIndex);
    if (oldIndex < newIndex) {
      --newIndex;
    }
    items.insert(newIndex, item);

    final newText = items.map((e) => e.text).join('\n');
    ref.read(textSourceProvider.notifier).update(newText);
  }
}
