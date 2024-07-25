import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stats/models/graph_model.dart';
import 'package:stats/provider/BarGraph_Provider.dart';
import 'package:stats/utils/responsive.dart';
import 'package:stats/widgets/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';

class BarGraphCard extends StatelessWidget {
  const BarGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BarGraphProvider>(
      builder: (context, provider, child) {
        return GridView.builder(
          itemCount: provider.bardata.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: !Responsive.isDesktop(context) ? 2 : 3,
            crossAxisSpacing: !Responsive.isDesktop(context) ? 12 : 15,
            mainAxisSpacing: 12.0,
            childAspectRatio: 5 / 4,
          ),
          itemBuilder: (context, index) {
            final barData = provider.bardata[index];
            return CustomCard(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      barData.label,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        barGroups: _chartGroups(
                          points: barData.graph,
                          color: barData.color,
                        ),
                        borderData: FlBorderData(border: const Border()),
                        gridData: const FlGridData(show: false),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                final int index = value.toInt() - 1;
                                if (index >= 0 && index < barData.graph.length) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      barData.graph[index].l,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<BarChartGroupData> _chartGroups({
    required List<GraphModel> points,
    required Color color,
  }) {
    return points.map((point) {
      return BarChartGroupData(
        x: point.x.toInt(),
        barRods: [
          BarChartRodData(
            toY: point.y,
            width: 12,
            color: color.withOpacity(point.y > 4 ? 1 : 0.4),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3.0),
              topRight: Radius.circular(3.0),
            ),
          ),
        ],
      );
    }).toList();
  }
}
