import 'package:hsos/exams/stats/service/grade_prediction.dart';
import 'package:hsos/models/key_value.dart';
import 'package:hsos/models/semester.dart';

class Statistics {
  Statistics({
    this.bachelor,
    this.master,
    this.any,
  });

  final PerGraduation bachelor;
  final PerGraduation master;
  final PerGraduation any;
}

class PerGraduation {
  PerGraduation({
    this.type,
    this.averageGrade,
    this.hoursPerWeekPerSemester,
    this.weekHoursGradesPerSemester,
    this.predictedAverageGradeForNextSemester,
    this.gradeCount,
    this.averageGradePerSemester,
  });

  final GraduationType type;
  final double averageGrade;

  /// Eine List von [KeyValue] bei dem der [KeyValue.key] das Semester ist
  /// und [KeyValue.value] die Anzahl der Stunden pro Woche ist.
  final List<KeyValue> hoursPerWeekPerSemester;

  /// Welche Note wie oft geschrieben wurde
  final List<KeyValue> gradeCount;

  /// Durchschnittsnote pro Semester
  final List<KeyValue> averageGradePerSemester;

  final List<GradePrediction> weekHoursGradesPerSemester;

  /// Vorhersage der Durchschnittsnote für das nächste Semester
  final double predictedAverageGradeForNextSemester;
}
