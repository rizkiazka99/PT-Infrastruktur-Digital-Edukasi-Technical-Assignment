import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/login_entity.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/domain/entities/auth/token_entities.dart';

@immutable
abstract class LoginState extends Equatable {}

class InitialLoginState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoadingLoginState extends LoginState {
  @override
  List<Object?> get props => [];
}

class SuccessLoginState extends LoginState {
  final LoginEntity loginResponse;
  final TokenEntity tokenResponse;

  SuccessLoginState({
    required this.loginResponse, 
    required this.tokenResponse
  });

  @override
  List<Object?> get props => [loginResponse, tokenResponse];
}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState({ required this.message });

  @override
  List<Object?> get props => [message];
}