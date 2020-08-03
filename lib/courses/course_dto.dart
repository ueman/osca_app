import 'package:floor/floor.dart';
import 'package:osca_dart/app/models/course.dart';

@Entity(tableName: 'Course')
class CourseDto {
  CourseDto();

  factory CourseDto.from(Course element) {
    return CourseDto()
      ..courseID = element.courseID
      ..courseDataID = element.courseDataID
      ..courseNumber = element.courseNumber
      ..courseName = element.courseName
      ..eventType = element.eventType
      ..eventCategory = element.eventCategory
      ..semesterID = element.semesterID
      ..semesterName = element.semesterName
      ..creditPoints = element.creditPoints
      ..hoursPerWeek = element.hoursPerWeek
      ..smallGroups = element.smallGroups
      ..courseLanguage = element.courseLanguage
      ..facultyName = element.facultyName
      ..maxStudents = element.maxStudents
      ..instructorsString = element.instructorsString
      ..moduleName = element.moduleName
      ..moduleNumber = element.moduleNumber
      ..listener = element.listener
      ..acceptedStatus = element.acceptedStatus
      ..materialPresent = element.materialPresent
      ..infoPresent = element.infoPresent;
  }

  /// ist leider nicht eindeutig
  int courseID;

  /// ist eindeutig
  @primaryKey
  String courseDataID;

  String courseNumber;
  String courseName;
  String eventType;
  String eventCategory;
  String semesterID;
  String semesterName;
  String creditPoints;
  String hoursPerWeek;
  String smallGroups;
  String courseLanguage;
  String facultyName;
  String maxStudents;
  String instructorsString;
  String moduleName;
  String moduleNumber;
  String listener;
  String acceptedStatus;
  String materialPresent;
  String infoPresent;
}
