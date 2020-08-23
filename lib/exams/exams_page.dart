import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hsos/db/database.dart';
import 'package:hsos/exams/exams_bloc.dart';
import 'package:hsos/models/semester_group.dart';
import 'package:hsos/widgets/error_scaffold.dart';
import 'package:hsos/widgets/loading_scaffold.dart';
import 'package:osca_dart/app/models/exam.dart';
import 'package:osca_dart/app/osca_app_api.dart';
import 'package:provider/provider.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ExamsBloc(
        context.read<OscaAppApi>(),
        context.read<AppDatabase>(),
      ),
      child: BlocBuilder<ExamsBloc, ExamsState>(
        builder: (context, state) => state.when(
          error: (message) => ErrorScaffold(
            title: 'Noten',
            errorMessage: message,
          ),
          loading: () => const LoadingScaffold(
            title: 'Noten',
          ),
          loaded: (exams) => _ExamsListScaffold(
            exams: exams,
          ),
        ),
      ),
    );
  }
}

class _ExamsListScaffold extends StatelessWidget {
  const _ExamsListScaffold({Key key, this.exams}) : super(key: key);
  final List<SemesterGroup<Exam>> exams;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Noten')),
      body: CustomScrollView(
        slivers: [
          ...exams.map((e) {
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
                  (context, i) => _ExamTile(
                    exam: e.semester[i],
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

class _ExamTile extends StatelessWidget {
  const _ExamTile({Key key, this.exam}) : super(key: key);

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(exam.realName),
      subtitle: Text(exam.examName),
      leading: CircleAvatar(
        backgroundColor: exam.statusColor,
        child: Text(
          exam.statusEmoji,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      trailing: exam.hasNumberAsGrade
          ? Text(
              exam.grade,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
    );
  }
}

extension ExamX on Exam {
  String get realName {
    // context sieht beispielweise so aus:
    // "11B0192-2-PR-EuI Grundlagen Programmierung (Praktikum) - Gr. 1MI"
    // Wir wollen aber den Foo bis zum ersten Space nicht.
    return context.split(' ').skip(1).join(' ');
  }

  String get statusEmoji {
    switch (statusSystem) {
      case '0':
        return '❓️';
      case '1':
        return '✅';
      case '2':
        return '❓️';
      case '3':
        return '☠️';
      case '4':
        return '🏥';
    }
    return '❓';
  }

  Color get statusColor {
    switch (statusSystem) {
      case '0':
        return Colors.grey;
      case '1':
        return Colors.green;
      case '2':
        return Colors.grey;
      case '3':
        return Colors.red;
      case '4':
        return Colors.yellow;
    }
    return Colors.grey;
  }

  bool get hasNumberAsGrade {
    // Exam.grade kann auch 'be' fuer 'bestanden' sein,
    // daher muss dass auch ueberprueft werden.

    return grade != null && grade.trim().isNotEmpty && grade.trim() != 'be';
  }
}
/*

  /// Typ des Status
  /// 0 = noch nicht veröffentlicht
  /// 1 = bestanden
  /// 2 = noch nicht veröffentlicht
  /// 3 = nicht bestanden
  /// 4 = entschuldigt
  String statusSystem;
 */
