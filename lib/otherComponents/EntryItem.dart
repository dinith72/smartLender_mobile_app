import 'package:flutter/material.dart';
import 'package:mobile_app/otherComponents/Entry.dart';
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) // if there is no children the below component is returned
      return new ListTile(
          title: new Text(root.title), // the heading is returned in the title

          subtitle: new Text(root.content), // the conent is returned in the subtitle

      );
    return new ExpansionTile( // if there is childeren that child is returned
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