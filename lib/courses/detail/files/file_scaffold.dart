import 'package:flutter/material.dart';
import 'package:hsos/courses/detail/files/file_node.dart';

class FileScaffold extends StatelessWidget {
  const FileScaffold({Key key, this.rootNode}) : super(key: key);

  final FileNode rootNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dateibereich'),
      ),
      body: rootNode.toWidgetTree(),
    );
  }
}
