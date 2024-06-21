part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnlogEvent extends LoginEvent {
  final String username;
  final String password;

  OnlogEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
