import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:hsos/courses/detail/course_detail_bloc.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:osca_dart/web/models/course_file.dart';

class FileNode {
  FileNode({this.name, this.file});

  factory FileNode.fromList(List<CourseFile> files) {
    final rootNode = FileNode();
    for (final file in files) {
      rootNode.add(file.getPath(), file);
    }
    return rootNode;
  }

  final String name;
  final CourseFile file;

  bool get isRootNode => name == null && file == null;
  bool get isFile => file != null;
  List<FileNode> children = [];

  void add(List<String> path, CourseFile file) {
    if (path.length == 1) {
      children.add(
        FileNode(
          file: file,
          name: path.first,
        ),
      );
      return;
    }

    // schauen ob es bereits ein Kind mit dem Ordner gibt
    final child = children.firstWhere(
      (c) => c.name == path.first,
      orElse: () => null,
    );

    if (child != null) {
      // es gibt bereits ein Kind damit
      child.add(path.skip(1).toList(), file);
    } else {
      final newChild = FileNode(
        name: path.first,
      );
      newChild.add(path.skip(1).toList(), file);
      children.add(newChild);
    }
  }

  List<FileNode> getChildsForPath(List<String> path) {
    if (path.isEmpty) {
      return children;
    }
    var newChildren = children;
    for (final folder in path) {
      newChildren = newChildren.firstWhere((n) => n.name == folder).children;
    }
    return newChildren;
  }
}

extension CourseFileX on CourseFile {
  List<String> getPath() {
    final pathSegments = serverRelativeUrl
        .split('/')
        .where((segment) => segment != null && segment.trim().isNotEmpty)
        // skip 3 weil der Path mit "/lms/{courseId}/dat/" anfängt
        .skip(3)
        .toList();
    return pathSegments;
  }
}

extension FileListX on List<CourseFile> {
  FileNode toTree() => FileNode.fromList(this);
}

extension FileNodeX on FileNode {
  Widget toWidgetTree() {
    return Builder(
      builder: (context) {
        return TreeView(
          nodes: widgetChildren(context),
          indent: 20,
          treeController: TreeController(
            allNodesExpanded: false,
          ),
        );
      },
    );
  }

  List<TreeNode> widgetChildren(BuildContext context) {
    return children.map((e) {
      if (e.isFile) {
        final isPdf = e.file.name.endsWith('.pdf');
        return TreeNode(
          content: Expanded(
            child: ListTile(
              onTap: isPdf
                  ? () async {
                      final bytes =
                          await BlocProvider.of<CourseDetailBloc>(context)
                              .downloadFile(e.file);
                      await Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text(e.name),
                              ),
                              body: PdfView(
                                controller: PdfController(
                                  document: PdfDocument.openData(bytes),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  : null,
              title: Text(e.name),
            ),
          ),
        );
      }
      return TreeNode(
        content: Expanded(
          child: ListTile(title: Text('📂 ${e.name}')),
        ),
        children: e.widgetChildren(context),
      );
    }).toList();
  }
}
