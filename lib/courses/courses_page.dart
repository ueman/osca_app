import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hsos/courses/courses_bloc.dart';
import 'package:hsos/courses/detail/course_detail_page.dart';
import 'package:hsos/db/database.dart';
import 'package:hsos/models/semester_group.dart';
import 'package:hsos/widgets/error_scaffold.dart';
import 'package:hsos/widgets/loading_scaffold.dart';
import 'package:osca_dart/app/models/course.dart';
import 'package:osca_dart/app/osca_app_api.dart';
import 'package:provider/provider.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CoursesBloc(
        context.read<OscaAppApi>(),
        context.read<AppDatabase>(),
      ),
      child: BlocBuilder<CoursesBloc, CoursesState>(
        builder: (context, state) => state.when(
          error: (message) => ErrorScaffold(
            title: 'Kurse',
            errorMessage: message,
          ),
          loading: () => const LoadingScaffold(
            title: 'Kurse',
          ),
          loaded: (courses) => _CoursesListScaffold(
            courses: courses,
          ),
        ),
      ),
    );
  }
}

class _CoursesListScaffold extends StatelessWidget {
  const _CoursesListScaffold({Key key, this.courses}) : super(key: key);
  final List<SemesterGroup<Course>> courses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kurse')),
      body: CustomScrollView(
        slivers: [
          ...courses.map((e) {
            return SliverStickyHeader(
              header: Container(
                height: 30,
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    e.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => _CourseListTile(
                    course: e.semester[i],
                  ),
                  childCount: e.semester.length,
                ),
              ),
            );
          }).toList(growable: false)
        ],
      ),
    );
  }
}

class _CourseListTile extends StatelessWidget {
  const _CourseListTile({Key key, @required this.course}) : super(key: key);

  final Course course;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(course.courseName),
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CourseDetailPage(
                course: course,
              );
            },
          ),
        );
      },
    );
  }
}
