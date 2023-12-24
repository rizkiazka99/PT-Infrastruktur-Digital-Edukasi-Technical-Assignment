import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/result.dart';

abstract class UseCase<Type, Params> {
  Future<bool> get hasInternetConnection async =>
      await Connectivity().checkConnectivity() != ConnectivityResult.none;

  Future<Result<Type>> call(Params params);
}