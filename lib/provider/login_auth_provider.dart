// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stats/reqHandler/ApiClient.dart';
import 'package:stats/utils/notification.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _userId;
  String? _username;
  int? _userIndex;
  int? _admin;
  int? _roleIndex;

  bool get isLoading => _isLoading;
  bool get obscurePassword => _obscurePassword;
  String? get userId => _userId;
  String? get username => _username;
  int? get userIndex => _userIndex;
  int? get admin => _admin;
  int? get roleIndex => _roleIndex;

  // final ApiService _apiService = ApiService();

  AuthProvider() {
    _loadAppState();
  }

  Future<void> _loadAppState() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      _userId = prefs.getString('userId');
      _username = prefs.getString('username');
      _userIndex = prefs.getInt('userindex');
      _admin = prefs.getInt('admin');
      _roleIndex = prefs.getInt('roleindex');
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error loading app state: $e');
      }
    }
  }

  Future<void> _saveAppState() async {
    try {
      // print("5. Saving Data to shared Pref.");  
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', _userId!);
      prefs.setString('username', _username!);
      prefs.setInt('userindex', _userIndex!);
      prefs.setInt('admin', _admin!);
      prefs.setInt('roleindex', _roleIndex!);
    } catch (e) {
      if (kDebugMode) {
        print('Error saving app state: $e');
      }
    }
  }

  Future<int?> getUSerIndex() async {
    int? userIndex=0;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      userIndex= prefs.getInt('userindex');
    } catch (e) {
      if (kDebugMode) {
        print('Error saving app state: $e');
      }
    }
    return userIndex;
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  Future<void> login(
      BuildContext context, String userId, String password) async {
        // print("3. Inside login func of provider.");  
    _isLoading = true;
    notifyListeners();
    try {
      final response = await ApiService.mobileLogin(userId, password);
      print("4. After response $response");  
      if (response['status'] == '1') {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        print("5. After Successful response from server $response");  
        _userId = response['userId'] ?? '';
        _username = response['username'] ?? '';
        _userIndex = response['userindex'] ?? 0;
        _admin = response['admin'] ?? 0;
        _roleIndex = response['roleindex'] ?? 0;
        prefs.setInt('login', 0);

        await _saveAppState();
        if (_roleIndex == 5 && admin == 1) {
          MyNotification.success(context, 'Login Successful');
          Future.delayed(const Duration(seconds: 1), () {
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
            Navigator.pushReplacementNamed(context, '/dashboard');
          });
        } 
      } else {
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
        MyNotification.error(context, response['message']);
      }
    } catch (e) {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
      MyNotification.error(context, 'Network error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout(BuildContext context) async {
    if (_userIndex == 0 || _userIndex == null) {
      MyNotification.error(context, 'Invalid user index. Cannot perform logout.');
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.mobileLogout(_userIndex!);

      if (response['status'] == '1') {
        _userId = null;
        _username = null;
        _userIndex = null;
        _admin = null;

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('userId');
        await prefs.remove('username');
        await prefs.remove('userindex');
        await prefs.remove('admin');

        // Navigator.pushReplacementNamed(context, RoutesName.login);

        MyNotification.success(context, 'Logout Successful');
      } else {
        MyNotification.error(context, response['message']);
      }
    } catch (e) {
      MyNotification.error(context, 'Network error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
