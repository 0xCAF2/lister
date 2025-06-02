class Item {
  const Item({
    required this.text,
    required this.id,
  });

  final String text;
  final int id;

  int get indent => text.length - text.trimLeft().length;

  bool get isNumbered {
    return text.startsWith(RegExp(r'^\d+\. '));
  }

  Item copyWith({String? text, int? id}) {
    return Item(
      text: text ?? this.text,
      id: id ?? this.id,
    );
  }
}
