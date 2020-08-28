import 'package:hsos/models/key_value.dart';
import 'package:hsos/models/semester.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

/*
Einige lustige Datenbankabfragen die man jetzt machen kann:

-- wie oft man entschuldigt war
SELECT Status, COUNT(GradeDescription) as Count
FROM Exam
WHERE StatusSystem IS '4'

-- wie oft man durchgefallen ist
SELECT GradeDescription, COUNT(GradeDescription) as Count
FROM Exam
WHERE StatusSystem IS '3'

-- noten und datum
SELECT Grade as GradeDescription, dueDate
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE Grade IS NOT NULL
AND Grade IS NOT 'be'
AND Semester.type = 'bachelor'
ORDER BY Exam.dueDate ASC

*/
class StatisticsDb {
  StatisticsDb(this.database);

  final sqflite.DatabaseExecutor database;

  /// Durchschnittsnote pro Semester
  Future<double> getAverageGrade({GraduationType type}) async {
    final query = '''
SELECT AVG(grade) as average
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE grade IS NOT NULL
${_restriction(type, 'AND')}
AND grade IS NOT 'be'
AND Exam.statusSystem IS '1'
''';

    final result = await database.rawQuery(query);
    return result[0]['average'] as double;
  }

  /// Wieviele Wochenstunden pro Semester gemacht wurden
  Future<List<KeyValue>> getHoursPerWeek({GraduationType type}) async {
    final query = '''
SELECT SemesterName as key, SUM(HoursPerWeek) as value
FROM Course
LEFT JOIN Semester ON Course.SemesterID = Semester.Id
${_restriction(type, 'WHERE')}
GROUP BY SemesterID
''';

    final result = await database.rawQuery(query);
    return result.map((e) => KeyValue.fromMap(e)).toList(growable: false);
  }

  /// Welche Noten wie oft geschrieben wurden
  Future<List<KeyValue>> gradeCount({GraduationType type}) async {
    final query = '''
SELECT Grade as key, COUNT(Grade) as value
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE Grade IS NOT NULL
AND Grade IS NOT 'be'
AND GradeDescription IS NOT ''
${_restriction(type, 'AND')}
GROUP BY Grade
''';

    final result = await database.rawQuery(query);
    return result.map((e) => KeyValue.fromMap(e)).toList(growable: false);
  }

  /// Durchschnittsnote pro Semester
  Future<List<KeyValue>> averageGradePerSemester({GraduationType type}) async {
    final query = '''
SELECT Semester.name as key, AVG(Grade) as value
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE Grade IS NOT NULL
AND Grade IS NOT 'be'
${_restriction(type, 'AND')}
AND Exam.StatusSystem IS '1'
GROUP BY Semester.id
''';

    final result = await database.rawQuery(query);
    return result.map((e) => KeyValue.fromMap(e)).toList(growable: false);
  }

  String _restriction(GraduationType type, String prefix) {
    if (type == null) {
      return '';
    }
    switch (type) {
      case GraduationType.bachelor:
        return "$prefix Semester.type IS 'bachelor'";
      case GraduationType.master:
        return "$prefix Semester.type IS 'master'";
    }
    return '';
  }
}
