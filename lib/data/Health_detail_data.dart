import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stats/models/health_model.dart';
import 'package:stats/utils/constant.dart';

class HealthDetails {
  List<HealthModel> healthData = [];

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.callsInfoEndPoint));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        healthData = data.map((item) => HealthModel.fromJson(item)).toList();
        
        await saveToSharedPreferences(healthData);
      } else {
        throw Exception('Failed to load health data');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }

  Future<void> saveToSharedPreferences(List<HealthModel> data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> jsonData = data.map((item) => json.encode(item.toJson())).toList();
      await prefs.setStringList('healthData', jsonData);
    } catch (e) {
      if (kDebugMode) {
        print('Error saving to SharedPreferences: $e');
      }
    }
  }

  Future<void> loadFromSharedPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String>? jsonData = prefs.getStringList('healthData');
      if (jsonData != null) {
        healthData = jsonData.map((item) => HealthModel.fromJson(json.decode(item))).toList();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading from SharedPreferences: $e');
      }
    }
  }
}
