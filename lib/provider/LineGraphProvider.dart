import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stats/utils/constant.dart';
import 'package:http/http.dart' as http;

class LineGraphProvider extends ChangeNotifier {
  List<FlSpot> spot = [];

  final leftTitle = {
    0: '0',
    20: '20',
    40: '40',
    60: '60',
    80: '80',
    100: '100'
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

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.MWGraphEndPoint));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Line fetched: $data");
        }
        await saveApiResponse(data);
        await loadGraphData();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }


  static Future<void> saveApiResponse(List<dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(response);
    await prefs.setString('linedata', jsonString);
  }

  static Future<List<FlSpot>> getApiResponse() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('linedata');
    if (jsonString != null) {
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return _convertToGraphModel(
          jsonData.map((item) => Map<String, dynamic>.from(item)).toList());
    }
    return [];
  }
  
  static List<FlSpot> _convertToGraphModel(List<dynamic> data) {
    return data
        .map((entry) => FlSpot(entry['x'].toDouble(), entry['y'].toDouble()))
        .toList();
  }


  Future<void> loadGraphData() async {
    List<FlSpot> graphData = await getApiResponse();
    spot = graphData;
    notifyListeners();
  }
}