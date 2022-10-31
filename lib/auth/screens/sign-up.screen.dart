import 'dart:async';

import 'package:eam_domotic_frontend/shared/services/snack_bar_provider.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:eam_domotic_frontend/shared/widgets/buttons/custom_button.widget.dart';
import 'package:eam_domotic_frontend/shared/widgets/forms/form_control.widget.dart';
import 'package:eam_domotic_frontend/shared/widgets/forms/label.widget.dart';
import 'package:eam_domotic_frontend/shared/widgets/other/second_logo_app.widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool _hasErrors = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    void signUp() async {
      if (_loading != true) {
        setState(() {
          _loading = true;
          _hasErrors = false;
          FocusManager.instance.primaryFocus?.unfocus();
        });

        Timer(const Duration(seconds: 2), (() {
          if (username.text == '') {
            SnackBarProvider(
                context: context,
                message: 'All fields are required',
                status: 'error');

            setState(() {
              _hasErrors = true;
            });
          } else if (password.text == '' ||
              confirmPassword.text == '' ||
              password.text != confirmPassword.text) {
            SnackBarProvider(
                context: context,
                message:
                    "The confirm password doesn't corresponding with the password entered",
                status: 'error');

            setState(() {
              confirmPassword.text == '';
              _hasErrors = true;
            });
          } else if (username.text == 'GilberttValentine' ||
              username.text == 'user123') {
            SnackBarProvider(
                context: context,
                message: 'Username has already taken',
                status: 'error');
            setState(() {
              confirmPassword.text == '';
              _hasErrors = true;
            });
          } else {
            SnackBarProvider(
                context: context,
                message: '${username.text} please login next');
            Navigator.popAndPushNamed(context, 'signIn');
          }

          setState(() {
            _loading = false;
          });
        }));
      }

      return;
    }

    return Scaffold(
      body: SafeArea(
          child: ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: AppTheme.appInitialBackgroundColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 65, 30, 60),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                          width: 368, height: 50, child: SecondLogoApp()),
                      Container(
                        width: constraints.maxWidth,
                        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.2),
                        ),
                      ),
                      Container(
                        width: 368,
                        padding: const EdgeInsets.only(bottom: 40),
                        child: const Text(
                          'Create a new account',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              letterSpacing: -0.2),
                        ),
                      ),
                      const Label(label: 'Username'),
                      FormControl(
                        controller: username,
                        type: 'text',
                        placeholder: 'Username',
                        width: 368,
                        hasErrors: _hasErrors,
                        event: () {
                          setState(() {
                            _hasErrors = false;
                          });
                        },
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 25 - (_hasErrors == true ? 9 : 0))),
                      const Label(label: 'Password'),
                      FormControl(
                        controller: password,
                        type: 'password',
                        placeholder: 'Password',
                        width: 368,
                        hasErrors: _hasErrors,
                        event: () {
                          setState(() {
                            _hasErrors = false;
                          });
                        },
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 25 - (_hasErrors == true ? 9 : 0))),
                      const Label(label: 'Confirm Password'),
                      FormControl(
                        controller: confirmPassword,
                        type: 'password',
                        placeholder: 'Confirm Password',
                        width: 368,
                        hasErrors: _hasErrors,
                        event: () {
                          setState(() {
                            _hasErrors = false;
                          });
                        },
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 40 - (_hasErrors == true ? 9 : 0))),
                      CustomButton(
                          width: 368,
                          variant: 'outlined',
                          type: 'primary',
                          event: () => signUp(),
                          loading: _loading,
                          text: 'Create Account'),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                      ),
                      SizedBox(
                        width: 368,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: const Text(
                                "Already have an account?",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                //cleanForm();
                                Navigator.pushNamed(context, 'signIn');
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: AppTheme.primaryColor),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
        }),
      )),
      resizeToAvoidBottomInset: false,
    );
  }
}
