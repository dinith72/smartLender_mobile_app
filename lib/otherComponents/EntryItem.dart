import 'package:flutter/material.dart';
import 'package:mobile_app/otherComponents/Entry.dart';
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return new ListTile(
          title: new Text(root.title),

          subtitle: new Text(root.content),

      );
    return new ExpansionTile(
      key: new PageStorageKey<Entry>(root),
      title: new Text(root.title),

      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}