import 'dart:async';

import 'package:floor/floor.dart';
import 'package:hsos/courses/course_dto.dart';
import 'package:hsos/db/statistic_db.dart';
import 'package:hsos/exams/exam_dto.dart';
import 'package:hsos/models/semester.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

import 'osca_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [ExamDto, CourseDto], views: [Semester])
abstract class AppDatabase extends FloorDatabase {
  OscaDao get oscaDao;

  StatisticsDb get statisticDb => StatisticsDb(database);
}
