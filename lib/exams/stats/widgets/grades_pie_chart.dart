import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hsos/models/key_value.dart';

class GradesPieChart extends StatelessWidget {
  const GradesPieChart({Key key, this.grades}) : super(key: key);

  /// [KeyValue.key] ist der Name der Note (e.g. 1,4)
  /// [KeyValue.value] ist die Anzahl wie oft die Note geschrieben wurde
  final List<KeyValue> grades;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        startDegreeOffset: -90,
        sectionsSpace: 0,
        centerSpaceRadius: 20,
        borderData: FlBorderData(
          show: false,
        ),
        sections: grades
            .map(
              (e) => PieChartSectionData(
                showTitle: true,
                title: e.key,
                value: double.parse(e.value),
                color: _getColor(),
                radius: 120,
              ),
            )
            .toList(),
      ),
    );
  }
}

int _colorIndex = 0;

Color _getColor() {
  final c = _colors[_colorIndex];
  _colorIndex = (_colorIndex + 1) % _colors.length;
  return c;
}

const _colors = [
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.blue,
  Colors.orange,
  Colors.deepPurple,
];
