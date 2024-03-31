class Item {
  const Item({
    required this.text,
    required this.id,
  });

  final String text;
  final int id;

  int get indent => text.length - text.trimLeft().length;
}
