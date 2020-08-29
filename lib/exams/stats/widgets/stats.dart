import 'package:flutter/material.dart';
import 'package:hsos/exams/stats/statistics.dart';
import 'package:hsos/exams/stats/widgets/grades_pie_chart.dart';
import 'package:hsos/exams/stats/widgets/week_hours_graph.dart';

class Stats extends StatelessWidget {
  const Stats({Key key, @required this.stats}) : super(key: key);

  final PerGraduation stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (stats.averageGrade != null)
          Text('Durchschnittsnote: ${stats.averageGrade.toStringAsFixed(2)}'),
        if (stats.predictedAverageGradeForNextSemester != null)
          Text('Durchschnittsnote für das nächste Semester: '
              '${stats.predictedAverageGradeForNextSemester.toStringAsFixed(2)}'
              '\nDies wurde mittels Linearer Regression ausgerechnet.'),
        if (stats.hoursPerWeekPerSemester != null)
          WeekHourGraph(
            items: stats.hoursPerWeekPerSemester,
            type: stats.type,
          ),
        if (stats.gradeCount != null)
          GradesPieChart(
            grades: stats.gradeCount,
          ),
      ],
    );
  }
}
