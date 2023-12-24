import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class InitiateLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const InitiateLoginEvent({
    required this.email, 
    required this.password
  });

  @override
  List<Object?> get props => [email, password];
}