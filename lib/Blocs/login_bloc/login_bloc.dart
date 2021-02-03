import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/Blocs/login_bloc/login_event.dart';
import 'package:test_flutter/Blocs/login_bloc/login_state.dart';
import 'package:test_flutter/api/services.dart';
import 'package:test_flutter/models/login/login_request.dart';
import 'package:test_flutter/models/login/login_response.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;
  String email = "", password = "";

  LoginBloc({this.loginRepo}) : super(LoginInitState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      // _mapLoginSubmittedToState(event, state);
      if (email.isNotEmpty && password.isNotEmpty) {
        // yield SubmitStatus(status: false, textError: "");
        yield LoginLoading();

        try {
          LoginRequest request = LoginRequest(email: email, password: password);

          LoginResponse loginResponse = await loginRepo.login(request);

          if (loginResponse.code != 200) {
            yield SubmitStatus(status: true, textError: loginResponse.message);
          } else {
            yield LoginSuccess(loginResponse: loginResponse);
          }
        } on SocketException {
          yield SubmitStatus(status: true, textError: "No Internet");
        } on HttpException {
          yield SubmitStatus(status: true, textError: "No Service Found");
        } on FormatException {
          yield SubmitStatus(
              status: true, textError: "Invalid Response Format");
        } catch (e) {
          yield SubmitStatus(status: true, textError: "Unknown Error");
        }
      } else {
        yield SubmitStatus(
            status: true, textError: "Email atau password tidak sesuai.");
      }
    }
  }

  // ignore: missing_return
  LoginState _mapEmailChangedToState(
    LoginEmailChanged event,
    LoginState state,
  ) {
    email = event.email;
  }

  // ignore: missing_return
  LoginState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    password = event.password;
  }
}
