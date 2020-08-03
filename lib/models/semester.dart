class Semester {
  String name;
  String id;
  bool master;
  bool bachelor;
}

/*
CREATE VIEW IF NOT EXISTS Semester AS
SELECT
  SemesterName as Name,
  SemesterID AS Id,
  SUM(Master) as Master,
  SUM(Bachelor) as Bachelor
FROM (
	SELECT
	  DISTINCT SemesterName,
	  SemesterID,
	  CourseNumber LIKE '%M%' AS Master,
	  CourseNumber LIKE '%B%' AS Bachelor
	FROM StudentEvent
	WHERE CourseNumber LIKE '%M%'
	OR CourseNumber LIKE '%B%'
) as temp
GROUP BY SemesterName
ORDER BY SemesterID ASC
";
 */
