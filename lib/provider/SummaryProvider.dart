import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:stats/models/summary_model.dart';
import 'package:stats/utils/constant.dart';

class SummaryProvider with ChangeNotifier {
  SummaryModel? _summary;

  SummaryModel? get summary => _summary;

  Future<void> fetchSummaryData() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.MSummaryEndPoint)).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)[0];
        _summary = SummaryModel.fromJson(data);
        await _saveSummaryData(data);
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      await _loadSummaryData();
    }
  }

  void load() async{
    await _loadSummaryData();
  }

  Future<void> _saveSummaryData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(data);
    await prefs.setString('summaryData', jsonString);
    await _loadSummaryData();
  }

  Future<void> _loadSummaryData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('summaryData');
    if (jsonString != null) {
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      _summary = SummaryModel.fromJson(jsonData);
      notifyListeners();
    }
  }
}
