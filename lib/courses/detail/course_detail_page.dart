import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsos/courses/detail/course_detail_bloc.dart';
import 'package:hsos/widgets/error_scaffold.dart';
import 'package:hsos/widgets/loading_scaffold.dart';
import 'package:osca_dart/osca_dart.dart';
import 'package:hsos/courses/detail/files/file_node.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({Key key, @required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CourseDetailBloc(course),
      child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
        builder: (context, state) => state.when(
          error: (message) => ErrorScaffold(
            title: course.courseName,
            errorMessage: message,
          ),
          loading: () => LoadingScaffold(
            title: course.courseName,
          ),
          loaded: (files, announcements) => _CourseDetailScaffold(
            course: course,
            files: files,
            announcements: announcements,
          ),
        ),
      ),
    );
  }
}

class _CourseDetailScaffold extends StatelessWidget {
  const _CourseDetailScaffold({
    Key key,
    @required this.files,
    @required this.announcements,
    @required this.course,
  }) : super(key: key);

  final Course course;
  final List<CourseFile> files;
  final List<Announcement> announcements;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseName),
      ),
      body: ListView(
        children: <Widget>[
          const Text('Ankündigungen'),
          ...announcements.map((e) {
            return ListTile(
              title: Text(e.title),
              subtitle: Text(e.body),
            );
          }).toList(growable: false),
          const Text('Dateien'),
          files.toTree().toWidgetTree()
        ],
      ),
    );
  }
}
