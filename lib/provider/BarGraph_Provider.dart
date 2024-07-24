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
      color: AppColor.yellow,
      graph: [],
    ),
    BarGraphModel(
      label: "Getaflight",
      color: AppColor.red,
      graph: const [],
    ),
    BarGraphModel(
      label: "Voliamo",
      color: AppColor.piecolor2,
      graph: const [],
    ),
    BarGraphModel(
      label: "Get A Cruise",
      color: AppColor.piecolor1,
      graph: const [],
    ),
    BarGraphModel(
      label: "Click A Holiday",
      color: AppColor.piecolor1,
      graph: const [],
    ),
    BarGraphModel(
      label: "Call For Umrah",
      color: AppColor.piecolor1,
      graph: const [],
    ),
    BarGraphModel(
      label: "PH Travel Ltd",
      color: AppColor.piecolor1,
      graph: const [],
    ),
    BarGraphModel(
      label: "Get A Flight USA",
      color: AppColor.piecolor1,
      graph: const [],
    ),
  ];
  final List<String> label = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];

  Future<void> fetchData1() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.wTGraphEndPoint));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Total fetched: $data");
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

  Future<void> fetchData2() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.wMGraphEndPoint));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Missed fetched: $data");
        }
        await saveApiResponse2(data);
        await loadGraphData2();
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
      final response = await http.get(Uri.parse(AppUrl.wSGraphEndPoint));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("SLA fetched: $data");
        }
        await saveApiResponse3(data);
        await loadGraphData3();
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
      final response = await http.get(Uri.parse(AppUrl.wAGraphEndPoint));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (kDebugMode) {
          print("Answer fetched2: $data");
        }
        await saveApiResponse4(data);
        await loadGraphData4();
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
        .map((entry) => GraphModel(x: entry['x'].toDouble(), y: entry['y'].toDouble()))
        .toList();
  }






  static Future<void> saveApiResponse(List<dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(response);
    await prefs.setString('apiResponse', jsonString);
  }

  static Future<void> saveApiResponse2(List<dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(response);
    await prefs.setString('apiResponse2', jsonString);
  }

  static Future<void> saveApiResponse3(List<dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(response);
    await prefs.setString('apiResponse3', jsonString);
  }

  static Future<void> saveApiResponse4(List<dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(response);
    await prefs.setString('apiResponse4', jsonString);
  }


  
  static Future<List<GraphModel>> getApiResponse() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('apiResponse');
    if (jsonString != null) {
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return _convertToGraphModel(
          jsonData.map((item) => Map<String, dynamic>.from(item)).toList());
    }
    return [];
  }

  static Future<List<GraphModel>> getApiResponse2() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('apiResponse2');
    if (jsonString != null) {
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return _convertToGraphModel(
          jsonData.map((item) => Map<String, dynamic>.from(item)).toList());
    }
    return [];
  }

  static Future<List<GraphModel>> getApiResponse3() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('apiResponse3');
    if (jsonString != null) {
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return _convertToGraphModel(
          jsonData.map((item) => Map<String, dynamic>.from(item)).toList());
    }
    return [];
  }
  static Future<List<GraphModel>> getApiResponse4() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('apiResponse4');
    if (jsonString != null) {
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return _convertToGraphModel(
          jsonData.map((item) => Map<String, dynamic>.from(item)).toList());
    }
    return [];
  }

  Future<void> loadGraphData() async {
    List<GraphModel> graphData = await getApiResponse();
    bardata[0] = BarGraphModel(
      label: "Perfect Holidays",
      color: AppColor.yellow,
      graph: graphData,
    );
    notifyListeners();
  }

  Future<void> loadGraphData2() async {
    List<GraphModel> graphData = await getApiResponse2();
    bardata[1] = BarGraphModel(
      label: "Getaflight",
      color: AppColor.red,
      graph: graphData,
    );
    notifyListeners(); // Notify listeners to rebuild UI
  }

  Future<void> loadGraphData3() async {
    List<GraphModel> graphData = await getApiResponse3();
    bardata[2] = BarGraphModel(
      label: "Voliamo",
      color: AppColor.piecolor2,
      graph: graphData,
    );
    notifyListeners(); // Notify listeners to rebuild UI
  }

  Future<void> loadGraphData4() async {
    List<GraphModel> graphData = await getApiResponse4();
    bardata[3] = BarGraphModel(
      label: "Get A Cruise",
      color: AppColor.piecolor1,
      graph: graphData,
    );
    notifyListeners(); // Notify listeners to rebuild UI
  }

}
