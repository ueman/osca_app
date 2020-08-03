import 'package:osca_dart/app/models/exam.dart';

class ExamDto {
  ExamDto();

  factory ExamDto.from(Exam exam) {
    return ExamDto()
      ..examID = exam.examID
      ..examName = exam.examName
      ..context = exam.context
      ..contextType = exam.contextType
      ..subject = exam.subject
      ..beginDate = exam.beginDate
      ..dueDate = exam.dueDate
      ..timeFrom = exam.timeFrom
      ..timeTo = exam.timeTo
      ..grade = exam.grade
      ..gradeDescription = exam.gradeDescription
      ..instructorString = exam.instructorString
      ..status = exam.status
      ..statusSystem = exam.statusSystem
      ..semesterID = exam.semesterID
      ..semesterName = exam.semesterName;
  }

  int examID;

  /// Name der Prüfung, also Abschlussarbeit/Kolloquium/Prüfungsleistung
  String examName;

  /// Name des Moduls
  String context;

  /// Modul, Kurs oder so
  String contextType;
  String subject;

  /// Im Format 20.11.2017
  String beginDate;

  /// Im Format 20.11.2017
  String dueDate;

  /// Im Format 12:00
  String timeFrom;

  /// Im Format 12:00
  String timeTo;

  /// Note als Zahl, zB. 1,7
  String grade;

  /// Textuelle Beschreibung der Note
  /// z.B: sehr gut, gut, etc
  String gradeDescription;

  /// Name des Lehrenden
  String instructorString;

  /// Textuelle beschreibung von statusSystem
  String status;

  /// Typ des Status
  /// 1 = bestanden
  /// 2 = noch nicht veröffentlicht
  /// 3 = nicht bestanden
  /// 4 = entschuldigt
  String statusSystem;

  String semesterID;

  /// Name des Semester, "WiSe18/19"
  String semesterName;
}
