import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/login_entity.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/repositories/auth/auth_repository.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/result.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/use_case.dart';

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email, 
    required this.password
  });
}

class LoginUseCase extends UseCase<LoginEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({ required this.repository });

  @override
  Future<Result<LoginEntity>> call(LoginParams params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    } else {
      return repository.login(params: params);
    }
  }
}