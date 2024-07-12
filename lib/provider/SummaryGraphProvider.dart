import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:stats/models/Summary_model.dart';
import 'package:stats/utils/constant.dart';

class ChartDataProvider with ChangeNotifier {
  SummaryModel? _chartData;

  SummaryModel? get chartData => _chartData;

  Future<void> fetchChartData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString('chartData');

    if (savedData != null) {
      _chartData = SummaryModel.fromJson(json.decode(savedData));
      notifyListeners();
    }

    try {
      final response = await http.get(Uri.parse(AppUrl.MSummaryEndPoint)).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          _chartData = SummaryModel.fromJson(data[0]);
          prefs.setString('chartData', json.encode(_chartData!.toJson()));
          notifyListeners();
        }
      }
    } catch (error) {
      // Handle error
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
