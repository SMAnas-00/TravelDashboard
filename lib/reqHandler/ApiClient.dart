import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:stats/utils/constant.dart';

class ApiService {
  static Future<Map<String, dynamic>> mobileLogin(
      String userId, String password) async {
    try {
      final Map<String, dynamic> payload = {
        'UserId': userId,
        'Password': password,
      };

      final response = await http.post(
        Uri.parse(AppUrl.loginEndPoint),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("response successfull");
        }
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        return {
          'status': 'error',
          'message': 'Failed to login. Please try again later.',
        };
      }
    } on TimeoutException catch (_) {
      return {
        'status': 'error',
        'message': 'Request timed out. Please try again later.',
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'An error occurred. Please try again later.',
      };
    }
  }

  static Future<Map<String, dynamic>> mobileLogout(int userIndex) async {
    try {
      final Uri url = Uri.parse(AppUrl.logoutEndPoint);
      final Map<String, dynamic> payload = {
        'userindex': '$userIndex',
      };

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        return {
          'status': 'error',
          'message': 'Failed to logout. Please try again later.',
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'message': 'An error occurred. Please try again later.',
      };
    }
  }

  static Future<Map<String, dynamic>> mobileCallsInfo(String? userId) async {
    try {
      final Uri url = Uri.parse(AppUrl.logoutEndPoint);
    final Map<String, dynamic> payload = {
      'userid': '$userId',
    };
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(payload),
    );
    if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        return {
          'status': 'error',
          'message': 'Failed to Get Data. Please try again later.',
        };
      }
    } catch (e) {
      if (kDebugMode) {
        print("At mobileCallsInfo ==== > $e");
      }
      return {
        'status': 'error',
        'message': 'An error occurred. Please try again later.',
      };
    }
  }
  static Future<Map<String, dynamic>> details(String? userId) async {
    try {
      final Uri url = Uri.parse(AppUrl.callsDetailsEndPoint);
    final Map<String, dynamic> payload = {
      'userid': '$userId',
    };
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(payload),
    );
    if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        return {
          'status': 'error',
          'message': 'Failed to Get Data. Please try again later.',
        };
      }
    } catch (e) {
      if (kDebugMode) {
        print("At mobileCallsInfo ==== > $e");
      }
      return {
        'status': 'error',
        'message': 'An error occurred. Please try again later.',
      };
    }
  }
}
