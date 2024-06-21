// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

class LoginState extends Equatable {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final bool logincompleted;
  final bool founderror;

  LoginState({required this.logincompleted, required this.founderror});

  @override
  List<Object?> get props => [logincompleted, founderror];

  LoginState copyWith({
    bool? logincompleted,
    bool? founderror,
  }) {
    return LoginState(
        logincompleted: logincompleted ?? this.logincompleted,
        founderror: founderror ?? this.founderror);
  }
}
