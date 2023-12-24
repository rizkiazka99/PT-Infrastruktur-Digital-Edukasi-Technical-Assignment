import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/home/banner_list_entity.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/repositories/home/banner_repository.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/result.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/use_case.dart';

class BannerListUseCase extends UseCase {
  final BannerRepository repository;

  BannerListUseCase({ required this.repository });

  @override
  Future<Result<BannerListEntity>> call(dynamic params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    } else {
      return repository.getBannerList();
    }
  }
}