import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stats/models/bar_graph_model.dart';
import 'package:stats/models/graph_model.dart';
import 'package:stats/utils/colors.dart';
import 'package:stats/utils/constant.dart';
import 'package:http/http.dart' as http;

class BarGraphData {
  List<BarGraphModel> bardata = [
    BarGraphModel(
      label: "Total",
      color: AppColor.yellow,
      graph: [],
    ),
    BarGraphModel(
      label: "Missed",
      color: AppColor.red,
      graph: const [],
    ),
    BarGraphModel(
      label: "SLA",
      color: AppColor.piecolor2,
      graph: const [],
    ),
  ];

  final List<String> label = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];

  Future<void> fetchData() async {
    if (kDebugMode) {
      print("Fetching data...");
    }
    try {
      final response = await http.get(Uri.parse(AppUrl.WAGraphEndPoint));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Data fetched: $data");
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

  static List<GraphModel> _convertToGraphModel(List<dynamic> data) {
    return data.map((entry) => GraphModel(x: entry['x'].toDouble(), y: entry['y'].toDouble())).toList();
  }

  static Future<void> saveApiResponse(List<dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(response);
    await prefs.setString('apiResponse', jsonString);
  }

  static Future<List<GraphModel>> getApiResponse() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('apiResponse');
    if (jsonString != null) {
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return _convertToGraphModel(jsonData.map((item) => Map<String, dynamic>.from(item)).toList());
    }
    return [];
  }

  Future<void> updateBarData(List<dynamic> data) async {
    final List<GraphModel> graphData = _convertToGraphModel(data);
    bardata[0] = BarGraphModel(
      label: "Total",
      color: AppColor.yellow,
      graph: graphData,
    );
    if (kDebugMode) {
      print("Updated bardata: ${bardata[0].graph}");
    }
  }

  Future<void> loadGraphData() async {
    List<GraphModel> graphData = await getApiResponse();
    if (kDebugMode) {
      print(graphData);
    }
    bardata[0] = BarGraphModel(
      label: "Total",
      color: AppColor.yellow,
      graph: graphData,
    );
  }
}
