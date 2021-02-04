import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:test_flutter/Screens/Login/components/background.dart';
import 'package:test_flutter/Screens/Welcome/welcome_screen.dart';
import 'package:test_flutter/Screens/home/home_screen.dart';
import 'package:test_flutter/Widgets/rounded_input_field.dart';
import 'package:test_flutter/Widgets/rounded_password_field.dart';
import 'package:test_flutter/blocs/login_bloc/login_bloc.dart';
import 'package:test_flutter/blocs/login_bloc/login_state.dart';
import 'package:test_flutter/constant.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  _showModalBottomSheet(context) {
    return Container(
      height: 400.0,
      width: double.infinity,
      color: Colors.transparent, //could change this to Color(0xFF737373),
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
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: RoundedInputField(
                  hintText: "Username or Email",
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: RoundedPasswordField(
                  hintText: "Password",
                  onChanged: (value) {},
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
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
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
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      progressWidget: const CircularProgressIndicator(),
                      width: double.infinity,
                      height: 50,
                      borderRadius: 30,
                      animate: true,
                      color: Colors.black,
                      type: ProgressButtonType.Raised,
                      onPressed: () async {
                        int score = await Future.delayed(
                            const Duration(milliseconds: 1000), () => 42);
                        // After [onPressed], it will trigger animation running backwards, from end to beginning
                        return () {
                          print(score);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        };
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [_showModalBottomSheet(context)],
        ),
      ),
    );
  }
}

// class _UsernameInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//       buildWhen: (previous, current) => previous.username != current.username,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('loginForm_usernameInput_textField'),
//           onChanged: (username) =>
//               context.read<LoginBloc>().add(LoginUsernameChanged(username)),
//           decoration: InputDecoration(
//             labelText: 'username',
//             errorText: state.username.invalid ? 'invalid username' : null,
//           ),
//         );
//       },
//     );
//   }
// }

// class _PasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//       buildWhen: (previous, current) => previous.password != current.password,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('loginForm_passwordInput_textField'),
//           onChanged: (password) =>
//               context.read<LoginBloc>().add(LoginPasswordChanged(password)),
//           obscureText: true,
//           decoration: InputDecoration(
//             labelText: 'password',
//             errorText: state.password.invalid ? 'invalid password' : null,
//           ),
//         );
//       },
//     );
//   }
// }

// class _LoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginBloc, LoginState>(
//       buildWhen: (previous, current) => previous.status != current.status,
//       builder: (context, state) {
//         return state.status.isSubmissionInProgress
//             ? const CircularProgressIndicator()
//             : RaisedButton(
//                 key: const Key('loginForm_continue_raisedButton'),
//                 child: const Text('Login'),
//                 onPressed: state.status.isValidated
//                     ? () {
//                         context.read<LoginBloc>().add(const LoginSubmitted());
//                       }
//                     : null,
//               );
//       },
//     );
//   }
// }