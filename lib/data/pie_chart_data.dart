import 'package:fl_chart/fl_chart.dart';
import 'package:stats/utils/colors.dart';

class ChartData {
  final piechartsectionData = [
    PieChartSectionData(
      color: AppColor.piecolor3,
      value: 1192,
      showTitle: false,
      radius: 25,
    ),
    PieChartSectionData(
      color: AppColor.piecolor1,
      value: 1140,
      showTitle: false,
      radius: 25,
    ),
    PieChartSectionData(
      color: AppColor.red,
      value: 52,
      showTitle: false,
      radius: 25,
    ),
    // PieChartSectionData(
    //   color: AppColor.piecolor1.withOpacity(0.1),
    //   value: 25,
    //   showTitle: false,
    //   radius: 13,
    // ),
  ];
}