import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/home/banner_list_entity.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/result.dart';

abstract class BannerRepository {
  Future<Result<BannerListEntity>> getBannerList();
}