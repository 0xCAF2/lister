import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lister/item_list_view.dart';
import 'package:lister/text_data.dart';

class Lister extends HookConsumerWidget {
  const Lister({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    useEffect(() {
      textController.addListener(() {
        ref.read(textDataProvider.notifier).update(textController.text);
      });
      return null;
    }, const []);
    ref.listen(textDataProvider, (previous, next) {
      textController.text = next;
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText:
                      'Enter text. eg.\nItem 1 \\n\nItem 2 \\n\n Item 2-1',
                ),
                expands: true,
                maxLines: null,
              ),
            ),
            const SizedBox(width: 400, child: ItemListView()),
          ],
        ),
      ),
    );
  }
}
