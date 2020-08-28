import 'package:floor/floor.dart';

@DatabaseView('''
SELECT
  DISTINCT semesterName AS name,
  semesterID AS id,
CASE
    WHEN courseNumber LIKE '%M%' THEN 'master'
    WHEN courseNumber LIKE '%B%' THEN 'bachelor'
END AS type
FROM Course
WHERE courseNumber LIKE '%M%'
OR courseNumber LIKE '%B%'
ORDER BY semesterID ASC''', viewName: 'Semester')
class Semester {
  Semester(
    this.name,
    this.id,
    this.type,
  );

  final String name;
  final String id;
  final String type;
}

extension SemesterX on Semester {
  GraduationType get graduation {
    switch (type) {
      case 'bachelor':
        return GraduationType.bachelor;
      case 'master':
        return GraduationType.master;
    }
    return GraduationType.bachelor;
  }
}

enum GraduationType {
  bachelor,
  master,
}
