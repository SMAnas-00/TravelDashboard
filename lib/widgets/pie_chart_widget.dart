import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stats/provider/SummaryGraphProvider.dart';
import 'package:stats/utils/colors.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    final chartDataProvider = Provider.of<ChartDataProvider>(context);
    final chartData = chartDataProvider.chartData;

    if (chartData == null) {
      return const Center(child: SizedBox());
    }

    final pieChartSectionData = [
      PieChartSectionData(
        color: AppColor.piecolor3,
        value: chartData.totalCalls.toDouble(),
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: AppColor.piecolor1,
        value: chartData.answered.toDouble(),
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: AppColor.red,
        value: chartData.missed.toDouble(),
        showTitle: false,
        radius: 25,
      ),
    ];

    String displayText;
    String additionalText;
    if (touchedIndex != null) {
      switch (touchedIndex) {
        case 0:
          displayText = "${chartData.totalCalls}";
          additionalText = "in total";
          break;
        case 1:
          displayText = "${chartData.answered}";
          additionalText = "answered";
          break;
        case 2:
          displayText = "${chartData.missed}";
          additionalText = "missed";
          break;
        default:
          displayText = "${chartData.totalCalls}";
          additionalText = "in total";
      }
    } else {
      displayText = "${chartData.totalCalls}";
      additionalText = "in total";
    }

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: pieChartSectionData,
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = null;
                      return;
                    }
                    touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                Text(
                  displayText,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColor.base,
                      fontWeight: FontWeight.w600,
                      height: 0.5),
                ),
                const SizedBox(height: 8),
                Text(additionalText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
