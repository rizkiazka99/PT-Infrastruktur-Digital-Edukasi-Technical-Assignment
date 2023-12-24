import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/token_entities.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/repositories/auth/auth_repository.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/result.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/use_case.dart';

class TokenParams {
  final String grantType;
  final String clientId;
  final String clientSecret;
  final String username;
  final String password;
  final String scope;

  TokenParams({
    required this.grantType, 
    required this.clientId,
    required this.clientSecret, 
    required this.username, 
    required this.password,
    required this.scope
  });
}

class TokenUseCase extends UseCase<TokenEntity, TokenParams> {
  final AuthRepository repository;

  TokenUseCase({required this.repository});

  @override
  Future<Result<TokenEntity>> call(TokenParams params) async {
    if (!await hasInternetConnection) {
      return Result.noInternet();
    } else {
      return repository.getToken(params: params);
    }
  }
  
}