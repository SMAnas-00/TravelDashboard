import 'package:flutter/material.dart';
import 'package:stats/models/health_model.dart';
import 'package:stats/data/Health_detail_data.dart';

class HealthProvider with ChangeNotifier {
  final HealthDetails _healthDetails = HealthDetails();
  List<HealthModel> _healthData = [];
  bool _isLoading = true;

  List<HealthModel> get healthData => _healthData;
  bool get isLoading => _isLoading;

  HealthProvider() {
    loadData();
  }

  Future<void> loadData() async {
    await _healthDetails.loadFromSharedPreferences();
    if (_healthDetails.healthData.isEmpty) {
      await fetchData();
    } else {
      _healthData = _healthDetails.healthData;
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchData() async {
    await _healthDetails.fetchData();
    _healthData = _healthDetails.healthData;
    _isLoading = false;
    notifyListeners();
  }
}
