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
    return Consumer<SummaryProvider>(
        builder: (context, provider, child) {
          final summary = provider.summary;
          return CustomCard(
            color: const Color(0xFF2F353E),
            child: summary == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildDetails('Perfect Holiday', summary.b1.toString(), AppColor.bar1),
                          buildDetails('Getaflight', summary.b2.toString(), AppColor.bar2),
                          buildDetails('Valiamo', summary.b3.toString(), AppColor.bar3),
                          buildDetails('Get A Cruise', summary.b4.toString(), AppColor.bar4),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildDetails('Click A Holiday', summary.b5.toString(), AppColor.bar1),
                          buildDetails('Call For Umrah', summary.b6.toString(), AppColor.bar2),
                          buildDetails('PH Travel Ltd', summary.b7.toString(), AppColor.bar3),
                          buildDetails('Getaflight USA', summary.b8.toString(), AppColor.bar4),
                        ],
                      ),
                  ],
                ),
          );
        },
      );
  }

  Widget buildDetails(String key, String value, Color mycolor) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Column(
        children: [
          Text(
            key,
            style: TextStyle(fontSize: 10, color: mycolor),
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
