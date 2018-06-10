class Entry {
  Entry(this.title, this.content, [this.children = const <Entry>[]]);

  final String title;
  final String content;
  final List<Entry> children;
}