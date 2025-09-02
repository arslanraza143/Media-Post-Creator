import 'dart:convert';

import 'package:frontend/Controller/Auth/auth_controller.dart';
import 'package:frontend/Controller/Other/connection_manager_controller.dart';
import 'package:frontend/Core/Constants/app_strings.dart';
import 'package:frontend/Core/Network/api_response.dart';
import 'package:frontend/app_config.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static final String _baseUrl = AppConfig.rootURL ?? '';
  static const Duration _timeout = Duration(seconds: 15);
AuthController get _authController => Get.find<AuthController>();
  final Map<String, String> _defaultHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, String>? headers,
    
  }) {
    return _request<T>(method: 'GET', url: _baseUrl + endpoint, headers: headers);
  }

  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    Map<String, String>? headers,
    Object? body
  }) {
    return _request<T>(method: 'POST', url: _baseUrl + endpoint, headers: headers, body: body);
  }

  Future<ApiResponse<T>> _request<T>({
    required method,
    required url,
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      var connectivity = Get.find<ConnectionManagerController>();
      if (!connectivity.isConnected.value) {
        return ApiResponse.error(ToastMsg.noInternetConnection);
      }
      final token = _authController.accessToken;
      final mergedHeader = {
        ..._defaultHeader,
        if (token != null && token.isNotEmpty) 'Authorization': token,
        if (headers != null) ...headers,
      };

      //http.Response response;
      http.Response response;

      switch (method) {
        case 'GET':
          response = await http
              .get(Uri.parse(url), headers: mergedHeader)
              .timeout(_timeout);
          break;

        case 'POST':
          response = await http
              .post(Uri.parse(url), headers: mergedHeader, body: jsonEncode(body ?? {}))
              .timeout(_timeout);
          break;
        default:
          return ApiResponse.error("Invalid HTTP method: $method");
      }

      return _handleResponse<T>(response);
    } catch (e) {
      return ApiResponse.error("Invalid HTTP method: $method");
    }
  }

  ApiResponse<T> _handleResponse<T>(http.Response response) {
    final int statusCode = response.statusCode;
    final responseBody = response.body;

    try {
      // print('Response Body: $responseBody');
      // print('Status Code: $statusCode');
      final decoded = responseBody.isNotEmpty ? jsonDecode(responseBody) : null;
      if (statusCode >= 200 && statusCode < 300) {
        return ApiResponse.success(decoded as T, statusCode: statusCode);
      } else if (statusCode == 401 || statusCode == 403) {
        // 🔐 Handle auth expiry
        //_authController.logout();
        return ApiResponse.error("Unauthorized access. Please login again.", statusCode: statusCode,
        );
      } else if (statusCode == 422) {
        return ApiResponse.error("Validation error", statusCode: statusCode);
      } else if (statusCode >= 500) {
        return ApiResponse.error("Server error", statusCode: statusCode);
      } else {
        return ApiResponse.error("Unexpected error", statusCode: statusCode);
      }
    } catch (_) {
      return ApiResponse.error(
        "Failed to parse response",
        statusCode: statusCode,
      );
    }
  }
}
