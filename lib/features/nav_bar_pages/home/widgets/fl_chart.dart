import 'package:cmp_app/core/theming/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlCarts extends StatelessWidget {
  final Map<String, dynamic> attendanceStatistics;
  const FlCarts({super.key, required this.attendanceStatistics});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 30.h,
        bottom: 20.h,
        right: 30.h,
        left: 30.h,
      ),
      child: SizedBox(
        height: 200.h,
        child: LineChart(
          LineChartData(
            minY: 0,
            maxY: 30,
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(attendanceStatistics.keys.toList().length, (index) {
                  String month = attendanceStatistics.keys.toList()[index];
                  double attendancePercentage = attendanceStatistics[month]["present_days"]?.toDouble() ?? 0.0;
                  return FlSpot(index.toDouble(), attendancePercentage);
                }),
                colors: [Colors.blue],
                barWidth: 2,
              ),
            ],
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                getTitles: (value) {
                  int index = value.toInt();
                  if (index >= 0 && index < attendanceStatistics.keys.toList().length) {
                    return attendanceStatistics.keys.toList()[index].substring(0, 3); // Shorten to first 3 letters
                  }
                  return '';
                },
                margin: 10,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 5,
                getTextStyles: (value) => const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
