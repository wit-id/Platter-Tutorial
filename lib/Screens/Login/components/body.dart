import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:test_flutter/SessionManager.dart';
import 'package:test_flutter/blocs/login_bloc/login_bloc.dart';
import 'package:test_flutter/blocs/login_bloc/login_event.dart';
import 'package:test_flutter/blocs/login_bloc/login_state.dart';
import 'package:test_flutter/constant.dart';
import 'package:test_flutter/screens/home/home_screen.dart';
import 'package:test_flutter/screens/welcome/welcome_screen.dart';
import 'package:test_flutter/widgets/rounded_input_field.dart';
import 'package:test_flutter/widgets/rounded_password_field.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  SessionManager prefs = SessionManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          body: _body(),
        ),
      ),
    );
  }

  save(var data) async {
    // await EasyLoading.dismiss();
    prefs.setAuthToken(data);
    _navigationPage();
  }

  Future<void> _navigationPage() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  _body() {
    return Container(
      child: BlocBuilder<LoginBloc, LoginState>(
          builder: (BuildContext context, LoginState state) {
        bool statusError = false, statusSubmit = true;
        String textError = "Text Error";

        if (state is SubmitStatus) {
          // EasyLoading.dismiss();
          statusError = state.status;
          textError = state.textError;
        }

        if (state is LoginLoading) {
          // EasyLoading.show(status: 'loading...');
          statusSubmit = false;
        }

        if (state is LoginSuccess) {
          statusSubmit = false;
          save(state.loginResponse.data);
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 400.0,
                width: double.infinity,
                color: Colors
                    .transparent, //could change this to Color(0xFF737373),
                //so you don't have to change MaterialApp canvasColor
                child: Container(
                    padding: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.left,
                          ),
                          margin: EdgeInsets.all(16.0),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          child: RoundedInputField(
                            hintText: "Username or Email",
                            onChanged: (email) => context
                                .read<LoginBloc>()
                                .add(LoginEmailChanged(email)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          child: RoundedPasswordField(
                            hintText: "Password",
                            onChanged: (password) => context
                                .read<LoginBloc>()
                                .add(LoginPasswordChanged(password)),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            textColor: colorBlack,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()));
                            },
                            child: Text("Forgot Password?"),
                            shape: CircleBorder(
                                side: BorderSide(color: Colors.transparent)),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ProgressButton(
                                defaultWidget: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                progressWidget:
                                    const CircularProgressIndicator(),
                                width: double.infinity,
                                height: 50,
                                borderRadius: 30,
                                animate: true,
                                color: Colors.black,
                                type: ProgressButtonType.Raised,
                                onPressed: () async {
                                  int score = await Future.delayed(
                                      const Duration(milliseconds: 1000),
                                      () => 42);
                                  // After [onPressed], it will trigger animation running backwards, from end to beginning
                                  return () {
                                    print(score);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => HomeScreen(),
                                    //   ),
                                    // );
                                    context
                                        .read<LoginBloc>()
                                        .add(LoginSubmitted());
                                  };
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        );
      }),
    );
  }
}
