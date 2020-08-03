import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsos/courses/detail/course_detail_bloc.dart';
import 'package:osca_dart/osca_dart.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({Key key, @required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CourseDetailBloc(course),
      child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
        builder: (context, state) => state.when(
          error: (message) => Scaffold(
            body: Center(
              child: Text(message),
            ),
          ),
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (files, announcements) => _CourseDetailScaffold(
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
  }) : super(key: key);

  final List<CourseFile> files;
  final List<Announcement> announcements;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kursdetails'),
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
          ...files.map((e) {
            return ListTile(
              title: Text(e.name),
            );
          }).toList(growable: false),
        ],
      ),
    );
  }
}
