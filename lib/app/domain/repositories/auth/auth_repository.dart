import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/login_entity.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/token_entities.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/usecase/auth/login_use_case.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/usecase/auth/token_use_case.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/result.dart';

abstract class AuthRepository {
  Future<Result<LoginEntity>> login({
    required LoginParams params
  });

  Future<Result<TokenEntity>> getToken({
    required TokenParams params
  });
}