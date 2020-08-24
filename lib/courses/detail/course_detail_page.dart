import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsos/courses/detail/course_detail_bloc.dart';
import 'package:hsos/widgets/error_scaffold.dart';
import 'package:hsos/widgets/loading_scaffold.dart';
import 'package:html/parser.dart';
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
          if (announcements != null && announcements.isNotEmpty)
            Container(
              color: Theme.of(context).primaryColor,
              height: 40,
              child: Center(
                child: Text(
                  'Ankündigungen',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ...announcements.map((e) {
            return _AnnouncementTile(announcement: e);
          }).toList(growable: false),
          Container(
            color: Theme.of(context).primaryColor,
            height: 40,
            child: Center(
              child: Text(
                'Dateien',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          files.toTree().toWidgetTree()
        ],
      ),
    );
  }
}

class _AnnouncementTile extends StatelessWidget {
  const _AnnouncementTile({Key key, this.announcement}) : super(key: key);

  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              announcement.title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 4),
            Text(
              announcement.created,
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 4),
            Text(
              htmlToPlainText(announcement.body),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  String htmlToPlainText(String html) {
    final content =
        html.replaceAll('<br>', '\n').replaceAll('</p>', '</p>\n').trim();
    final document = parse(content);
    return parse(document.body.text).documentElement.text.trim();
    //final unescape = HtmlUnescape();
    //return unescape.convert(e.body);
  }
}
