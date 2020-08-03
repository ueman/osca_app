import 'package:hsos/models/key_value.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

/*
Einige lustige Datenbankabfragen die man jetzt machen kann:
-- Wochenstunden pro Semester
SELECT SemesterName as Key, SUM(HoursPerWeek) as Value
FROM Course
LEFT JOIN Semester ON Course.SemesterID = Semester.Id
GROUP BY SemesterID

-- gibt alle Master Semester zurück
SELECT DISTINCT SemesterID, SemesterName
FROM Course
WHERE CourseNumber LIKE '%m%'

-- wie oft man entschuldigt war
SELECT Status, COUNT(GradeDescription) as Count
FROM Exam
WHERE StatusSystem IS '4'

-- wie oft man durchgefallen ist
SELECT GradeDescription, COUNT(GradeDescription) as Count
FROM Exam
WHERE StatusSystem IS '3'

-- Welche Note wurde wie oft geschrieben
SELECT Grade as GradeDescription, COUNT(Grade) as Count
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE Grade IS NOT NULL
AND Grade IS NOT 'be'
AND Semester.bachelor = 1
-- kann hier allgemein oder fuer Master angepasst werden
GROUP BY Grade

-- noten und datum
SELECT Grade as GradeDescription, dueDate
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE Grade IS NOT NULL
AND Grade IS NOT 'be'
AND Semester.bachelor = 1
ORDER BY Exam.dueDate ASC

-- Durchschnittsnoten nach Semester, nicht nach Prüfungsordnung gewichte
SELECT AVG(Grade) as average, Semester.id, Semester.name
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE Grade IS NOT NULL
AND Grade IS NOT 'be'
AND Semester.bachelor = 1
AND Exam.StatusSystem IS '1'
GROUP BY Semester.id

*/
class StatisticsDb {
  StatisticsDb(this.database);

  final sqflite.DatabaseExecutor database;

  Future<double> getAverageBachelorGrade() async {
    const query = '''
SELECT AVG(grade) as average
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE grade IS NOT NULL
AND grade IS NOT 'be'
AND Semester.bachelor = 1
AND Exam.statusSystem IS '1'
''';

    final result = await database.rawQuery(query);
    return result[0]['average'] as double;
  }

  Future<double> getAverageMasterGrade() async {
    const query = '''
SELECT AVG(grade) as average
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE grade IS NOT NULL
AND grade IS NOT 'be'
AND Semester.master = 1
AND Exam.statusSystem IS '1'
''';

    final result = await database.rawQuery(query);
    return result[0]['average'] as double;
  }

  Future<double> getAverageGrade() async {
    const query = '''
SELECT AVG(grade) as average
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE grade IS NOT NULL
AND grade IS NOT 'be'
AND Exam.statusSystem IS '1'
''';

    final result = await database.rawQuery(query);
    return result[0]['average'] as double;
  }

  Future<List<KeyValue>> getHoursPerWeek() async {
    const query = '''
SELECT SemesterName as Key, SUM(HoursPerWeek) as Value
FROM Course
LEFT JOIN Semester ON Course.SemesterID = Semester.Id
GROUP BY SemesterID
''';

    final result = await database.rawQuery(query);
    return result.map((e) => KeyValue.fromMap(e)).toList(growable: false);
  }
}
