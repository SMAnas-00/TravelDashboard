import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stats/provider/LineGraphProvider.dart';
import 'package:stats/utils/colors.dart';
import 'package:stats/widgets/custom_card_widget.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Monthly Overview",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 16 / 6,
            child: Consumer<LineGraphProvider>(
              builder: (context, provider, _) {
                return LineChart(
                  LineChartData(
                    lineTouchData: const LineTouchData(handleBuiltInTouches: true),
                    gridData: const FlGridData(show: false),
                    titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                        getTitlesWidget: (value, meta) {
                          int intValue = value.toInt();
                          if (provider.bottomTitle.containsKey(intValue)) {
                            return Text(provider.bottomTitle[intValue]!);
                          }
                          return const SizedBox();
                        },
                      )),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                          int intValue = value.toInt();
                          if (provider.leftTitle.containsKey(intValue)) {
                            return Text(provider.leftTitle[intValue]!);
                          }
                          return const SizedBox();
                          },
                        reservedSize: 28,
                      )),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        color: AppColor.selectiondash,
                        barWidth: 2.5,
                        belowBarData: BarAreaData(
                          gradient: LinearGradient(
                            colors: [
                              AppColor.selectiondash.withOpacity(0.5),
                              Colors.transparent
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          show: true,
                        ),
                        dotData: const FlDotData(show: false),
                        spots: provider.spot,
                      ),
                    ],
                    minX: 0,
                    maxX: provider.bottomTitle.length.toDouble(),
                    minY: 0,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
