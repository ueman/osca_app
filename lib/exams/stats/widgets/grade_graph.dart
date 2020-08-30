import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hsos/models/key_value.dart';
import 'package:hsos/strings/texts.dart';

class GradesGraph extends StatelessWidget {
  const GradesGraph({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<KeyValue> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: LineChart(
            _createLineChartData(items),
          ),
        ),
        Text(
          Texts.of(context).gradeGraphTitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

LineChartData _createLineChartData(List<KeyValue> items) {
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
      bottomTitles: SideTitles(
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
          if (value.toInt() < items.length) {
            return items[value.toInt()].key;
          }
          return '';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        getTitles: (value) {
          return value.toInt().toString();
        },
        margin: 8,
        reservedSize: 20,
        interval: 1,
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(
          color: Color(0xff4e4965),
          width: 4,
        ),
        left: BorderSide(
          color: Colors.transparent,
        ),
        right: BorderSide(
          color: Colors.transparent,
        ),
        top: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    //maxY: 6,
    //minY: 1,
    lineBarsData: _createBarData(items),
  );
}

List<LineChartBarData> _createBarData(List<KeyValue> items) {
  final spots = <FlSpot>[];
  for (int i = 0; i < items.length; i++) {
    spots.add(FlSpot(i.toDouble(), double.parse(items[i].value)));
  }
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: spots,
    isCurved: true,
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
  return [
    lineChartBarData1,
  ];
}
