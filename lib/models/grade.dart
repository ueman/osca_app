class Grade {
  Grade(this.gradeDescription, this.count);

  factory Grade.fromMap(Map<String, dynamic> map) {
    return Grade(
      map['gradeDescription'] as String,
      map['count'] as int,
    );
  }

  final String gradeDescription;
  final int count;
}
