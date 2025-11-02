import 'package:flutter_advanced_course/core/networking/api_error_handler.dart';
import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/core/networking/api_service.dart';
import 'package:flutter_advanced_course/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced_course/features/login/data/models/login_response.dart';

class LoginRepo {
  // Implementation of login repository methods
  final ApiService apiService;
  LoginRepo(this.apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
