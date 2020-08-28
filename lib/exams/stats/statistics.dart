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
  });

  final GraduationType type;
  final double averageGrade;

  /// Eine List von [KeyValue] bei dem der [KeyValue.key] das Semester ist
  /// und [KeyValue.value] die Anzahl der Stunden pro Woche ist.
  final List<KeyValue> hoursPerWeekPerSemester;
}
