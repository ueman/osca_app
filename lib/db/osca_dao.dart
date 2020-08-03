import 'package:floor/floor.dart';
import 'package:hsos/courses/course_dto.dart';
import 'package:hsos/exams/exam_dto.dart';
import 'package:hsos/models/semester.dart';

@dao
abstract class OscaDao {
  @Query('SELECT * FROM Semester')
  Future<List<Semester>> getSemester();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertExams(List<ExamDto> exam);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCourses(List<CourseDto> course);
/*
  @Query('''
SELECT AVG(grade)
FROM Exam
LEFT JOIN Semester ON Exam.semesterID = Semester.id
WHERE grade IS NOT NULL
AND Semester.bachelor = 1
AND Exam.statusSystem IS '1' ''')
  Future<double> averageBachelorGrade();
 */
}
