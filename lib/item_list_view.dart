import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lister/items.dart';

class ItemListView extends HookConsumerWidget {
  const ItemListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        ref.read(itemsProvider.notifier).reorder(oldIndex, newIndex);
      },
      children: [
        for (final item in items)
          ListTile(
            key: ValueKey(item.id),
            title: Text(item.text),
          ),
      ],
    );
  }
}
