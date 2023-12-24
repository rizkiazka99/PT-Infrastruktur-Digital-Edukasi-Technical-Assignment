import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/data/model/auth/login_model.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/data/model/auth/token_models.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/login_entity.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/token_entities.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/repositories/auth/auth_repository.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/usecase/auth/login_use_case.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/usecase/auth/token_use_case.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/dio.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/result.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final _dio = DioHelper.init();

  @override
  Future<Result<LoginEntity>> login({
    required LoginParams params
  }) async {
    String endpoint = '/api/login';
    final data = {
      'email': params.email,
      'password': params.password
    };

    try {
      final response = await _dio.post(
        endpoint,
        data: data
      );
      final loginResponse = LoginModel.fromJson(response.data);
      
      return Result.success(loginResponse);
    } on DioException catch(err) {
      return Result.error(
        message: err.response?.data['responseSystemMessage'] ?? 'Something went wrong',
        code: err.response?.statusCode ?? -1
      );
    } catch(err) {
      debugPrint(err.toString());
      return Result.error(message: 'Unexpected error occurred');
    }
  }

  @override
  Future<Result<TokenEntity>> getToken({
    required TokenParams params
  }) async {
    String endpoint = '/oauth/token';
    final data = {
      "grant_type": params.grantType,
      "client_id" : params.clientId,
      "client_secret": params.clientSecret,
      "username" : params.username,
      "password" : params.password,
      "scope": params.scope
    };

    try {
      final response = await _dio.post(
        endpoint,
        data: data
      );
      final tokenResponse = TokenModel.fromJson(response.data);

      return Result.success(tokenResponse);
    } on DioException catch(err) {
      return Result.error(
        message: err.response?.data['message'] ?? 'Something went wrong',
        code: err.response?.statusCode ?? -1
      );
    } catch(err) {
      debugPrint(err.toString());
      return Result.error(message: 'Unexpected error occurred');
    }
  }
}