import 'package:lister/item.dart';
import 'package:lister/text_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'items.g.dart';

@riverpod
class Items extends _$Items {
  @override
  List<Item> build() {
    final text = ref.watch(textSourceProvider);
    return parse(text);
  }

  List<Item> parse(String text) {
    final lines = text.split('\n');
    final items = <Item>[];
    for (final line in lines) {
      items.add(Item(text: line, id: items.length));
    }
    return items;
  }

  void renumber(int oldIndex, int newIndex) {
    if (oldIndex == newIndex) return;
    if (oldIndex < newIndex) {
      final lastIndex = _findSentinel(oldIndex + 1, newIndex, 1);
      _renumberItem(oldIndex + 1, lastIndex, -1);
      _renumberItem(oldIndex, oldIndex + 1, newIndex - oldIndex - 1);
    } else {
      final firstIndex = _findSentinel(oldIndex - 1, newIndex, -1);
      _renumberItem(firstIndex, oldIndex, 1);
      _renumberItem(oldIndex, oldIndex + 1, newIndex - oldIndex);
    }
    reorder(oldIndex, newIndex);
  }

  int _findSentinel(int startIndex, int endIndex, int delta) {
    final items = state;
    var i = startIndex;
    for (; i > 0 && i < items.length; i += delta) {
      if (i == endIndex) {
        return i;
      }
      if (items[i].isNumbered) {
        continue;
      } else {
        break;
      }
    }
    return i;
  }

  void _renumberItem(int startIndex, int endIndex, int delta) {
    final items = state;
    for (var i = startIndex; i < endIndex; ++i) {
      final item = items[i];
      final match = RegExp(r'(\d+)\. ').firstMatch(item.text);
      if (match != null) {
        final number = int.parse(match.group(1)!);
        final newNumber = number + delta;
        items[i] = item.copyWith(
            text: item.text.replaceFirst('$number. ', '$newNumber. '));
      }
    }
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
