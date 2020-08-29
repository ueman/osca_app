class GradePrediction {
  GradePrediction(this.semester, this.grade, this.weekHours);

  factory GradePrediction.fromMap(Map<String, dynamic> map) {
    return GradePrediction(
      map['semester'].toString(),
      double.parse(map['grade'].toString()),
      double.parse(map['weekhours'].toString()),
    );
  }

  final String semester;
  final double grade;
  final double weekHours;
}
