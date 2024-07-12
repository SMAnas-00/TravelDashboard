import 'package:fl_chart/fl_chart.dart';

class LineData {
  final spot = const [
    FlSpot(0, 21.04),
    FlSpot(1, 19.82),
    FlSpot(2, 39.20),
    FlSpot(3, 46.54),
    FlSpot(4, 53.18),
    FlSpot(5, 78.95),
    FlSpot(6, 48.34),
    FlSpot(7, 80.04),
    FlSpot(8, 78.60),
    FlSpot(9, 90.0),
    FlSpot(10, 53.27),
    FlSpot(11, 57.60),
  ];

  final leftTitle = {
    0: '0',
    20: '2K',
    40: '4K',
    60: '6K',
    80: '8K',
    100: '10K'
  };
  final bottomTitle = {
    0: 'Jan',
    1: 'Feb',
    2: 'Mar',
    3: 'Apr',
    4: 'May',
    5: 'Jun',
    6: 'Jul',
    7: 'Aug',
    8: 'Sep',
    9: 'Oct',
    10: 'Nov',
    11: 'Dec',
  };
  
}