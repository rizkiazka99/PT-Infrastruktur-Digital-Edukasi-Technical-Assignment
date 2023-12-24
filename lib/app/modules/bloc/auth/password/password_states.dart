import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class PasswordState extends Equatable {}

class PasswordVisibilityState extends PasswordState {
  final bool isObscured;

  PasswordVisibilityState({required this.isObscured});

  @override
  List<Object?> get props => [isObscured];
}