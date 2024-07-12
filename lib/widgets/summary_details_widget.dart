import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stats/provider/SummaryProvider.dart';
import 'package:stats/utils/colors.dart';
import 'package:stats/widgets/custom_card_widget.dart';
// import 'package:stats/provider/summary_provider.dart';

class SummaryDetails extends StatelessWidget {
  const SummaryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SummaryProvider()..fetchSummaryData(),
      child: Consumer<SummaryProvider>(
        builder: (context, provider, child) {
          final summary = provider.summary;
          return CustomCard(
            color: const Color(0xFF2F353E),
            child: summary == null
                ? const Center(child: CircularProgressIndicator())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildDetails('Total Calls', summary.totalCalls.toString(), AppColor.piecolor3),
                      buildDetails('Answered', summary.answered.toString(), AppColor.piecolor1),
                      buildDetails('Missed', summary.missed.toString(), AppColor.red),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget buildDetails(String key, String value, Color mycolor) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Column(
        children: [
          Text(
            key,
            style: TextStyle(fontSize: 11, color: mycolor),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
