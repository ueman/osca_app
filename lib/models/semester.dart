import 'package:floor/floor.dart';

@DatabaseView('''
SELECT
  semesterName as name,
  semesterID AS id,
  SUM(master) as master,
  SUM(bachelor) as bachelor
FROM (
  SELECT
    DISTINCT semesterName,
    semesterID,
    courseNumber LIKE '%M%' AS master,
    courseNumber LIKE '%B%' AS bachelor
  FROM Course
  WHERE courseNumber LIKE '%M%'
  OR courseNumber LIKE '%B%'
)
GROUP BY semesterName
ORDER BY semesterID ASC''', viewName: 'Semester')
class Semester {
  Semester(
    this.name,
    this.id,
    this.master,
    this.bachelor,
  );

  final String name;
  final String id;
  final bool master;
  final bool bachelor;
}
