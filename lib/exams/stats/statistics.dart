import 'package:hsos/models/key_value.dart';

class Statistics {
  Statistics({
    this.averageBachelorGrade,
    this.averageMasterGrade,
    this.averageGrade,
    this.hoursPerWeekPerSemester,
  });

  final double averageBachelorGrade;
  final double averageMasterGrade;
  final double averageGrade;

  /// Eine List von [KeyValue] bei dem der [KeyValue.key] das Semester ist
  /// und [KeyValue.value] die Anzahl der Stunden pro Woche ist.
  final List<KeyValue> hoursPerWeekPerSemester;
}
