import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/data/repositories/auth/auth_repository_implementation.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/login_entity.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/token_entities.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/usecase/auth/login_use_case.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/usecase/auth/token_use_case.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/bloc/auth/login/login_events.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/bloc/auth/login/login_states.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/routes/app_routes.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/utils/result.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<InitiateLoginEvent>((event, emit) async {
      emit(LoadingLoginState());

      late LoginParams params;
      late LoginUseCase login;
      late Result<LoginEntity> loginResult;

      params = LoginParams(
        email: event.email, 
        password: event.password
      );
      login = LoginUseCase(repository: AuthRepositoryImplementation());
      loginResult = await login.call(params);

      if (loginResult.status is Success) {
        late TokenParams params;
        late TokenUseCase getToken;
        late Result<TokenEntity> tokenResult;

        params = TokenParams(
          grantType: 'password', 
          clientId: loginResult.data.responseData.clientId, 
          clientSecret: loginResult.data.responseData.clientSecret, 
          username: loginResult.data.responseData.email, 
          password: event.password, 
          scope: '*'
        );
        getToken = TokenUseCase(repository: AuthRepositoryImplementation());
        tokenResult = await getToken.call(params);

        if (tokenResult.status is Success) {
          emit(SuccessLoginState(
            loginResponse: loginResult.data,
            tokenResponse: tokenResult.data
          ));
        } else {
          emit(ErrorLoginState(message: tokenResult.message));
        }
      } else {
        emit(ErrorLoginState(message: loginResult.message));
      }
    });
  }
}