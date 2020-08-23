import 'package:hsos/models/semester_group.dart';
import 'package:osca_dart/app/models/belongs_to_semester.dart';

extension SemesterMappable<T extends BelongsToSemester> on List<T> {
  List<SemesterGroup<T>> mapToSemester() {
    final List<SemesterGroup<T>> semesters = [];
    for (final object in this) {
      final semester = semesters.firstWhere(
        (e) => e.id == object.semesterID,
        orElse: () => null,
      );
      if (semester == null) {
        final s = SemesterGroup<T>()
          ..name = object.semesterName
          ..id = object.semesterID;
        s.semester.add(object);
        semesters.add(s);
      } else {
        semester.semester.add(object);
      }
    }
    semesters.sort((a, b) => b.id.compareTo(a.id));
    return semesters;
  }
}
