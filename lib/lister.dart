import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lister/item_list_view.dart';
import 'package:lister/text_source.dart';
import 'package:lister/text_store.dart';

class Lister extends HookConsumerWidget {
  const Lister({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copied = useState(false);
    final listWidth = useState(400.0);
    final textController = useTextEditingController();
    ref.listen(textSourceProvider, (previous, next) {
      // .value must be used to notify the change.
      textController.value = textController.value
          .replaced(TextRange(start: 0, end: textController.text.length), next);
    });

    final savedText = ref.watch(textStoreProvider);
    final textToDebounce = useState('');
    final debouncedTextValue = useDebounced(
      textToDebounce.value,
      const Duration(milliseconds: 2000),
    );
    useEffect(() {
      textController.addListener(() {
        ref.read(textSourceProvider.notifier).update(textController.text);
        textToDebounce.value = textController.text;
      });
      return null;
    }, const []);

    // Saving the text is called by the debounced value.
    useEffect(() {
      if (debouncedTextValue == null) return null;
      ref.read(textStoreProvider.notifier).save(debouncedTextValue);
      return null;
    }, [debouncedTextValue]);

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 80, top: 24, bottom: 24),
        child: savedText.when(
          data: (text) {
            useEffect(() {
              // Updating by the saved text at first must be called
              // when the build() is done.
              WidgetsBinding.instance.addPostFrameCallback((_) {
                textController.value = textController.value.replaced(
                    TextRange(start: 0, end: textController.text.length), text);
              });
              return null;
            }, const []);
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: IconButton(
                    onPressed: () async {
                      await Clipboard.setData(
                          ClipboardData(text: textController.text));
                      copied.value = true;
                      await Future.delayed(const Duration(seconds: 3));
                      copied.value = false;
                    },
                    icon: copied.value
                        ? const Icon(Icons.check)
                        : const Icon(Icons.copy),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText:
                          'Enter text. eg.\nItem 1 \\n\nItem 2 \\n\n  Item 2-1',
                    ),
                    expands: true,
                    maxLines: null,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        final newWidth =
                            listWidth.value - (details.primaryDelta ?? 0);
                        final maxWidth =
                            MediaQuery.of(context).size.width - 240;
                        if (newWidth > 0 && newWidth < maxWidth) {
                          listWidth.value = newWidth;
                        }
                      },
                      child: const Icon(Icons.drag_indicator),
                    )
                  ],
                ),
                SizedBox(width: listWidth.value, child: const ItemListView()),
              ],
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
