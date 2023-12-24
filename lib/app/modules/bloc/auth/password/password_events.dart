import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class PasswordEvent extends Equatable {
  const PasswordEvent();
}

class ObscuredPasswordEvent extends PasswordEvent {
  @override
  List<Object?> get props => [];
}

class VisiblePasswordEvent extends PasswordEvent {
  @override
  List<Object?> get props => [];
}