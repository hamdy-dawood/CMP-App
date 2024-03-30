import 'package:cmp_app/core/theming/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlCarts extends StatelessWidget {
  const FlCarts({super.key});

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
            maxY: 15,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 1),
                  FlSpot(1, 4),
                  FlSpot(2, 0),
                  FlSpot(3, 10),
                  FlSpot(4, 8),
                  FlSpot(5, 14),
                ],
                colors: [ColorManager.mainColor],
                barWidth: 3,
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
                  switch (value.toInt()) {
                    case 0:
                      return 'Jan';
                    case 1:
                      return 'Feb';
                    case 2:
                      return 'Mar';
                    case 3:
                      return 'Apr';
                    case 4:
                      return 'May';
                    case 5:
                      return 'Jun';
                  }
                  return '';
                },
                margin: 10,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                reservedSize: 5,
                interval: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
