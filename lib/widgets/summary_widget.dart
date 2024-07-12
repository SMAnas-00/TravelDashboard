import 'package:flutter/material.dart';
import 'package:stats/widgets/pie_chart_widget.dart';
// import 'package:stats/widgets/scheduled_widget.dart';
import 'package:stats/widgets/summary_details_widget.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Chart(),
        Text(
          "Monthly Summary",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 16),
        SummaryDetails(),
        SizedBox(height: 40),
        // Scheduled(),
      ],
    );
  }
}
