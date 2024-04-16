import 'package:cmp_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Finish on time": 6,
      "Past the deadline ": 3,
      "Still angling": 2,
    };

    return PieChart(
      dataMap: dataMap,
      chartRadius: 0.4.sw,
      colorList: const [
        Color.fromRGBO(52, 173, 190, 1),
        Color.fromRGBO(234, 127, 2, 1),
        Color.fromRGBO(97, 98, 178, 1),
      ],
      legendOptions: LegendOptions(
        legendPosition: LegendPosition.right,
        legendTextStyle: TextStyle(
          fontSize: 15.sp,
          color: ColorManager.grey4,
          fontWeight: FontWeight.w400,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
          showChartValuesInPercentage: true,
          chartValueBackgroundColor: Colors.transparent,
          chartValueStyle: TextStyle(
            color: ColorManager.white,
          )),
    );
  }
}
