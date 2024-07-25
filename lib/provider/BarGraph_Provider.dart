import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stats/models/bar_graph_model.dart';
import 'package:stats/models/graph_model.dart';
import 'package:stats/utils/colors.dart';
import 'package:stats/utils/constant.dart';
import 'package:http/http.dart' as http;

class BarGraphProvider with ChangeNotifier {
  List<BarGraphModel> bardata = [
    BarGraphModel(
      label: "Perfect Holidays",
      color: AppColor.bar1,
      graph: [],
    ),
    BarGraphModel(
      label: "Getaflight",
      color: AppColor.bar2,
      graph: [],
    ),
    BarGraphModel(
      label: "Voliamo",
      color: AppColor.bar3,
      graph: [],
    ),
    BarGraphModel(
      label: "Get A Cruise",
      color: AppColor.bar4,
      graph: [],
    ),
    BarGraphModel(
      label: "Click A Holiday",
      color: AppColor.bar5,
      graph: [],
    ),
    BarGraphModel(
      label: "Call For Umrah",
      color: AppColor.bar6,
      graph: [],
    ),
    BarGraphModel(
      label: "PH Travel Ltd",
      color: AppColor.bar7,
      graph: [],
    ),
    BarGraphModel(
      label: "Get A Flight USA",
      color: AppColor.bar8,
      graph: [],
    ),
  ];

  Future<void> fetchData1() async {
    try {
      final response = await http.get(Uri.parse("${AppUrl.wTGraphEndPoint}&Index=1"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Total fetched: $data");
        }
        await saveApiResponse(data, 'apiResponse');
        await loadGraphData(0, 'apiResponse');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }

  Future<void> fetchData2() async {
    try {
      final response = await http.get(Uri.parse("${AppUrl.wTGraphEndPoint}&Index=2"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Missed fetched: $data");
        }
        await saveApiResponse(data, 'apiResponse2');
        await loadGraphData(1, 'apiResponse2');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }

  Future<void> fetchData3() async {
    try {
      final response = await http.get(Uri.parse("${AppUrl.wTGraphEndPoint}&Index=3"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("SLA fetched: $data");
        }
        await saveApiResponse(data, 'apiResponse3');
        await loadGraphData(2, 'apiResponse3');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }

  Future<void> fetchData4() async {
    try {
      final response = await http.get(Uri.parse("${AppUrl.wTGraphEndPoint}&Index=4"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Answer fetched2: $data");
        }
        await saveApiResponse(data, 'apiResponse4');
        await loadGraphData(3, 'apiResponse4');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }
  Future<void> fetchData5() async {
    try {
      final response = await http.get(Uri.parse("${AppUrl.wTGraphEndPoint}&Index=5"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Total fetched: $data");
        }
        await saveApiResponse(data, 'apiResponse5');
        await loadGraphData(4, 'apiResponse5');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }
  Future<void> fetchData6() async {
    try {
      final response = await http.get(Uri.parse("${AppUrl.wTGraphEndPoint}&Index=6"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Total fetched: $data");
        }
        await saveApiResponse(data, 'apiResponse6');
        await loadGraphData(5, 'apiResponse6');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }
  Future<void> fetchData7() async {
    try {
      final response = await http.get(Uri.parse("${AppUrl.wTGraphEndPoint}&Index=7"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Total fetched: $data");
        }
        await saveApiResponse(data, 'apiResponse7');
        await loadGraphData(6, 'apiResponse7');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }
  Future<void> fetchData8() async {
    try {
      final response = await http.get(Uri.parse("${AppUrl.wTGraphEndPoint}&Index=8"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Total fetched: $data");
        }
        await saveApiResponse(data, 'apiResponse8');
        await loadGraphData(7, 'apiResponse8');
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }


  static List<GraphModel> _convertToGraphModel(List<dynamic> data) {
    return data
        .map((entry) => GraphModel(x: entry['x'].toDouble(), y: entry['y'].toDouble(), l: entry['l']))
        .toList();
  }

  static Future<void> saveApiResponse(List<dynamic> response, String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(response);
    await prefs.setString(key, jsonString);
  }

  static Future<List<GraphModel>> getApiResponse(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return _convertToGraphModel(
          jsonData.map((item) => Map<String, dynamic>.from(item)).toList());
    }
    return [];
  }

  Future<void> loadGraphData(int index, String key) async {
    List<GraphModel> graphData = await getApiResponse(key);
    bardata[index] = BarGraphModel(
      label: bardata[index].label,
      color: bardata[index].color,
      graph: graphData,
    );
    notifyListeners();
  }
}