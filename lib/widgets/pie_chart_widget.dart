// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:stats/provider/SummaryGraphProvider.dart';
// import 'package:stats/utils/colors.dart';

// class Chart extends StatefulWidget {
//   const Chart({super.key});

//   @override
//   _ChartState createState() => _ChartState();
// }

// class _ChartState extends State<Chart> {
//   int? touchedIndex;

//   @override
//   Widget build(BuildContext context) {
//     final chartDataProvider = Provider.of<ChartDataProvider>(context);
//     final chartData = chartDataProvider.chartData;

//     if (chartData == null) {
//       return const Center(child: SizedBox());
//     }

//     final pieChartSectionData = [
//       PieChartSectionData(
//         color: AppColor.bar1,
//         value: chartData.b1.toDouble(),
//         showTitle: false,
//         radius: 25,
//       ),
//       PieChartSectionData(
//         color: AppColor.bar2,
//         value: chartData.b2.toDouble(),
//         showTitle: false,
//         radius: 25,
//       ),
//       PieChartSectionData(
//         color: AppColor.bar3,
//         value: chartData.b3.toDouble(),
//         showTitle: false,
//         radius: 25,
//       ),
//       PieChartSectionData(
//         color: AppColor.bar4,
//         value: chartData.b4.toDouble(),
//         showTitle: false,
//         radius: 25,
//       ),
//       PieChartSectionData(
//         color: AppColor.bar5,
//         value: chartData.b5.toDouble(),
//         showTitle: false,
//         radius: 25,
//       ),
//       PieChartSectionData(
//         color: AppColor.bar6,
//         value: chartData.b6.toDouble(),
//         showTitle: false,
//         radius: 25,
//       ),
//       PieChartSectionData(
//         color: AppColor.bar7,
//         value: chartData.b7.toDouble(),
//         showTitle: false,
//         radius: 25,
//       ),
//       PieChartSectionData(
//         color: AppColor.bar8,
//         value: chartData.b8.toDouble(),
//         showTitle: false,
//         radius: 25,
//       ),
//     ];

//     String displayText;
//     String additionalText;
//     if (touchedIndex != null) {
//       print(touchedIndex);
//       switch (touchedIndex) {
//         case 0:
//           displayText = "${chartData.b1}";
//           additionalText = "Perfect \n Holiday";
//           break;
//         case 1:
//           displayText = "${chartData.b2}";
//           additionalText = "GetaFlight";
//           break;
//         case 2:
//           displayText = "${chartData.b3}";
//           additionalText = "Valiamo";
//           break;
//         case 3:
//           displayText = "${chartData.b4}";
//           additionalText = "Get a \n Curise";
//           break;
//         case 4:
//           displayText = "${chartData.b5}";
//           additionalText = "Click A \n Holiday";
//           break;
//         case 5:
//           displayText = "${chartData.b6}";
//           additionalText = "Call For \n Umrah";
//           break;
//         case 6:
//           displayText = "${chartData.b7}";
//           additionalText = "PH Travel Ltd";
//           break;
//         case 7:
//           displayText = "${chartData.b8}";
//           additionalText = "Get A Flight \n USA";
//           break;
//         default:
//           displayText = "${chartData.b1}";
//           additionalText = "Perfect \n Holiday";
//       }
//     } else {
//       displayText = "${chartData.b1}";
//       additionalText = "Perfect \n Holiday";
//     }

//     return SizedBox(
//       height: 200,
//       child: Stack(
//         children: [
//           PieChart(
//             PieChartData(
//               sectionsSpace: 0,
//               centerSpaceRadius: 70,
//               startDegreeOffset: -90,
//               sections: pieChartSectionData,
//               pieTouchData: PieTouchData(
//                 touchCallback: (FlTouchEvent event, pieTouchResponse) {
//                   setState(() {
//                     if (!event.isInterestedForInteractions ||
//                         pieTouchResponse == null ||
//                         pieTouchResponse.touchedSection == null) {
//                       touchedIndex = null;
//                       return;
//                     }
//                     touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
//                   });
//                 },
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 20.0),
//                 Text(
//                   displayText,
//                   style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                       color: AppColor.base,
//                       fontWeight: FontWeight.w600,
//                       height: 0.5),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(additionalText),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



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
        color: AppColor.bar1,
        value: chartData.b1.toDouble(),
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: AppColor.bar2,
        value: chartData.b2.toDouble(),
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: AppColor.bar3,
        value: chartData.b3.toDouble(),
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: AppColor.bar4,
        value: chartData.b4.toDouble(),
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: AppColor.bar5,
        value: chartData.b5.toDouble(),
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: AppColor.bar6,
        value: chartData.b6.toDouble(),
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: AppColor.bar7,
        value: chartData.b7.toDouble(),
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: AppColor.bar8,
        value: chartData.b8.toDouble(),
        showTitle: false,
        radius: 25,
      ),
    ];

    // Determine the default display text and additional text based on the highest value
    int highestIndex = 0;
    double highestValue = chartData.b1.toDouble();
    List<double> values = [
      chartData.b1.toDouble(),
      chartData.b2.toDouble(),
      chartData.b3.toDouble(),
      chartData.b4.toDouble(),
      chartData.b5.toDouble(),
      chartData.b6.toDouble(),
      chartData.b7.toDouble(),
      chartData.b8.toDouble(),
    ];

    for (int i = 0; i < values.length; i++) {
      if (values[i] > highestValue) {
        highestValue = values[i];
        highestIndex = i;
      }
    }

    String displayText;
    String additionalText;
    if (touchedIndex != null) {
      switch (touchedIndex) {
        case 0:
          displayText = "${chartData.b1}";
          additionalText = "Perfect \n Holiday";
          break;
        case 1:
          displayText = "${chartData.b2}";
          additionalText = "GetaFlight";
          break;
        case 2:
          displayText = "${chartData.b3}";
          additionalText = "Valiamo";
          break;
        case 3:
          displayText = "${chartData.b4}";
          additionalText = "Get a \n Curise";
          break;
        case 4:
          displayText = "${chartData.b5}";
          additionalText = "Click A \n Holiday";
          break;
        case 5:
          displayText = "${chartData.b6}";
          additionalText = "Call For \n Umrah";
          break;
        case 6:
          displayText = "${chartData.b7}";
          additionalText = "PH Travel Ltd";
          break;
        case 7:
          displayText = "${chartData.b8}";
          additionalText = "Get A Flight \n USA";
          break;
        default:
          displayText = "${chartData.b1}";
          additionalText = "Perfect \n Holiday";
      }
    } else {
      switch (highestIndex) {
        case 0:
          displayText = "${chartData.b1}";
          additionalText = "Perfect \n Holiday";
          break;
        case 1:
          displayText = "${chartData.b2}";
          additionalText = "GetaFlight";
          break;
        case 2:
          displayText = "${chartData.b3}";
          additionalText = "Valiamo";
          break;
        case 3:
          displayText = "${chartData.b4}";
          additionalText = "Get a \n Curise";
          break;
        case 4:
          displayText = "${chartData.b5}";
          additionalText = "Click A \n Holiday";
          break;
        case 5:
          displayText = "${chartData.b6}";
          additionalText = "Call For \n Umrah";
          break;
        case 6:
          displayText = "${chartData.b7}";
          additionalText = "PH Travel Ltd";
          break;
        case 7:
          displayText = "${chartData.b8}";
          additionalText = "Get A Flight \n USA";
          break;
        default:
          displayText = "0";
          additionalText = "No Data";
      }
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
