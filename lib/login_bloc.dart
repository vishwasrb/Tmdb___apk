import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(logincompleted: false, founderror: false)) {
    on<OnlogEvent>(
      (event, emit) {
        const String username = 'vishwas@gmail.com';
        const String password = '123456';
        if (event.username == username && event.password == password) {
          print('done');
          emit(state.copyWith(logincompleted: true));
        } else {
          print('failed');
          emit(state.copyWith(founderror: true));
        }
      },
    );
  }
}
