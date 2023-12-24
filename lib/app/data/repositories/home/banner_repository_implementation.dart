import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/data/model/home/banner_list_model.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/home/banner_list_entity.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/repositories/home/banner_repository.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/dio.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/result.dart';

class BannerRepositoryImplementation extends BannerRepository {
  final _dio = DioHelper.init();

  @override
  Future<Result<BannerListEntity>> getBannerList() async {
    String endpoint = '/api/list-banner';

    try {
      final response = await _dio.get(endpoint);
      final bannerListResponse = BannerListModel.fromJson(response.data);

      return Result.success(bannerListResponse);
    } on DioException catch(err) {
      return Result.error(
        message: err.response?.data['responseMessage'] ?? 'Something went wrong',
        code: err.response?.statusCode ?? -1
      );
    } catch(err) {
      debugPrint(err.toString());
      return Result.error(message: 'Unexpected error occurred');
    }
  }
}