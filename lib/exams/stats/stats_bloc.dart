import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hsos/courses/course_dto.dart';
import 'package:hsos/db/database.dart';
import 'package:hsos/db/statistic_db.dart';
import 'package:hsos/exams/exam_dto.dart';
import 'package:hsos/exams/stats/statistics.dart';
import 'package:hsos/models/semester.dart';
import 'package:osca_dart/app/osca_app_api.dart';
import 'package:osca_dart/osca_dart.dart';

part 'stats_bloc.freezed.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc(this.api, this.db) : super(const StatsState.loading()) {
    add(const StatsEvent.reload());
  }
  final OscaAppApi api;
  final AppDatabase db;

  @override
  Stream<StatsState> mapEventToState(StatsEvent event) async* {
    final exams = await api.getExams();
    final courses = await api.getCourses();
    await db.oscaDao.insertExams(exams.map((e) => ExamDto.from(e)).toList());
    await db.oscaDao
        .insertCourses(courses.map((e) => CourseDto.from(e)).toList());

    yield StatsState.loaded(
      Statistics(
        any: await _loadFor(db.statisticDb, null),
        bachelor: await _loadFor(db.statisticDb, GraduationType.bachelor),
        master: await _loadFor(db.statisticDb, GraduationType.master),
      ),
    );
  }

  Future<PerGraduation> _loadFor(StatisticsDb db, GraduationType type) async {
    final averageGrade = await db.getAverageGrade(type: type);

    final hoursPerWeek = await db.getHoursPerWeek(type: type);

    return PerGraduation(
      type: type,
      averageGrade: averageGrade,
      hoursPerWeekPerSemester: hoursPerWeek,
    );
  }
}

@freezed
abstract class StatsEvent with _$StatsEvent {
  const factory StatsEvent.reload() = Reload;
}

@freezed
abstract class StatsState with _$StatsState {
  const factory StatsState.error(String message) = Error;
  const factory StatsState.loading() = Loading;
  const factory StatsState.loaded(Statistics stats) = Loaded;
}
