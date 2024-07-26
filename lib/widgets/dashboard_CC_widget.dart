import 'package:flutter/material.dart';
// import 'package:stats/data/Health_detail_data.dart';
import 'package:stats/utils/responsive.dart';
import 'package:stats/widgets/activity_detail_card_widget.dart';
import 'package:stats/widgets/bar_graph_card_widget.dart';
import 'package:stats/widgets/header_widget.dart';
import 'package:stats/widgets/line_chart_card_Revenue.dart';
import 'package:stats/widgets/line_chart_card_widget.dart';
import 'package:stats/widgets/summary_widget.dart';

class DashboardCCWidget extends StatelessWidget {
  const DashboardCCWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final healthdetails = HealthDetails();
    // healthdetails.fetchData();
    
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 18),
            const HeaderWidget(),
            const SizedBox(height: 18),
            const ActivityDetailCard(),
            const SizedBox(height: 28),
            if (!Responsive.isDesktop(context)) const SummaryWidget(),
            // const SizedBox(height: 18),
            const LineChartCard(),
            const SizedBox(height: 18),
            const LineChartCardRevenue(),
            const SizedBox(height: 18),
            const BarGraphCard(),
            const SizedBox(height: 18,)
            
          ],
        ),
      ),
    );
  }
}