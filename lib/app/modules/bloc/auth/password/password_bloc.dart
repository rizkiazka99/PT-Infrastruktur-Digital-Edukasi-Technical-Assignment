import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/bloc/auth/password/password_events.dart';
import 'package:infrastrukturdigitaledukasi_techincaltest/app/modules/bloc/auth/password/password_states.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordVisibilityState(isObscured: true)) {
    on<ObscuredPasswordEvent>((event, emit) async {
      emit(PasswordVisibilityState(isObscured: true));
    });

    on<VisiblePasswordEvent>((event, emit) async {
      emit(PasswordVisibilityState(isObscured: false));
    });
  }
}