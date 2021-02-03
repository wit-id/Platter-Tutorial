import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final loginResponse;
  LoginSuccess({this.loginResponse});
}

class SubmitStatus extends LoginState {
  final status;
  final textError;
  SubmitStatus({this.status, this.textError});
}
