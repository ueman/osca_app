import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hsos/exams/stats/service/grade_prediction.dart';
import 'package:hsos/models/semester.dart';

/// Plottet die Wochenstunden gegen die Durchschnittsnoten eines Semesters
class WeekHourGradesGraph extends StatelessWidget {
  const WeekHourGradesGraph({
    Key key,
    @required this.items,
    this.type,
  }) : super(key: key);

  final List<GradePrediction> items;
  final GraduationType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 400,
            child: LineChart(
              _createLineChartData(items),
            ),
          ),
        ),
        const Text('Wochenstunden pro Semester', textAlign: TextAlign.center),
        Text(type.toString(), textAlign: TextAlign.center),
      ],
    );
  }
}

LineChartData _createLineChartData(List<GradePrediction> items) {
  final weekHoursTitle = SideTitles(
    showTitles: true,
    reservedSize: 25,
    margin: 80,
    rotateAngle: -90,
    textStyle: const TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    getTitles: (value) {
      return value.toStringAsFixed(2);
    },
  );

  final gradesTitle = SideTitles(
    showTitles: true,
    textStyle: const TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    getTitles: (value) {
      return value.toString();
    },
    margin: 8,
    reservedSize: 20,
    interval: 5,
  );
  const transparenBorder = BorderSide(
    color: Colors.transparent,
  );
  return LineChartData(
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
      ),
      touchCallback: (LineTouchResponse touchResponse) {},
      handleBuiltInTouches: true,
    ),
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      bottomTitles: weekHoursTitle,
      leftTitles: gradesTitle,
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(
          color: Color(0xff4e4965),
          width: 4,
        ),
        left: transparenBorder,
        right: transparenBorder,
        top: transparenBorder,
      ),
    ),
    lineBarsData: _createBarData(items),
  );
}

List<LineChartBarData> _createBarData(List<GradePrediction> items) {
  final spots = <FlSpot>[];
  for (int i = 0; i < items.length; i++) {
    spots.add(FlSpot(items[i].weekHours, items[i].grade));
  }
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: spots,
    isCurved: false,
    colors: [
      const Color(0xff4af699),
    ],
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
    ),
  );
  return [lineChartBarData1];
}
