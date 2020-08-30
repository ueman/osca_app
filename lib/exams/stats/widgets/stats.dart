import 'package:flutter/material.dart';
import 'package:hsos/exams/stats/statistics.dart';
import 'package:hsos/exams/stats/widgets/grade_graph.dart';
import 'package:hsos/exams/stats/widgets/grades_pie_chart.dart';
import 'package:hsos/exams/stats/widgets/week_hours_graph.dart';
import 'package:hsos/models/semester.dart';
import 'package:hsos/strings/texts.dart';

class Stats extends StatelessWidget {
  const Stats({
    Key key,
    @required this.stats,
  }) : super(key: key);

  final PerGraduation stats;

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            stats.type.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Material(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (stats.averageGrade != null)
                  Row(
                    children: [
                      Text(
                        Texts.of(context).averageGrade(stats.averageGrade),
                        style: textStyle,
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            final info =
                                Texts.of(context).averageGradeDescription;
                            showInfoDialog(context, info);
                          },
                        ),
                      ),
                    ],
                  ),
                if (stats.predictedAverageGradeForNextSemester != null)
                  Row(
                    children: [
                      Text(
                        Texts.of(context).averageGradeForNextSemester(
                            stats.predictedAverageGradeForNextSemester),
                        style: textStyle,
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            final info = Texts.of(context)
                                .averageGradeCalculationDescription;
                            showInfoDialog(context, info);
                          },
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        if (stats.hoursPerWeekPerSemester != null)
          WeekHourGraph(
            items: stats.hoursPerWeekPerSemester,
          ),
        if (stats.averageGradePerSemester != null)
          GradesGraph(items: stats.averageGradePerSemester),
        if (stats.gradeCount != null) ...[
          const SizedBox(height: 20),
          GradesPieChart(
            grades: stats.gradeCount,
          ),
        ]
      ],
    );
  }

  Future<void> showInfoDialog(BuildContext context, String text) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(text),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text(Texts.of(context).ok),
            )
          ],
        );
      },
    );
  }
}
