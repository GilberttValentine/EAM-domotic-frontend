import 'dart:async';

import 'package:eam_domotic_frontend/auth/auth.module.dart';
import 'package:eam_domotic_frontend/shared/services/snack_bar_provider.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:eam_domotic_frontend/shared/widgets/buttons/custom_button.widget.dart';
import 'package:eam_domotic_frontend/shared/widgets/forms/form_control.widget.dart';
import 'package:eam_domotic_frontend/shared/widgets/forms/label.widget.dart';
import 'package:eam_domotic_frontend/shared/widgets/other/second_logo_app.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _hasErrors = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    void signIn() async {
      setState(() {
        _loading = true;
        _hasErrors = false;
      });

      if (username.text == '' || password.text == '') {
        SnackBarProvider(
            context: context, message: 'Invalid credentials', status: 'error');
        setState(() {
          _hasErrors = true;
        });
      } else {
        final authService = Provider.of<AuthService>(context, listen: false);

        await authService.loginUser(username.text, password.text).then((value) {
          SnackBarProvider(
            context: context,
            message: 'Welcome Back ${username.text}',
          );
          Navigator.popAndPushNamed(context, 'lights');
        }).onError((error, stackTrace) {
          SnackBarProvider(
            context: context,
            message: 'Invalid credentials',
            status: 'error',
          );
          setState(() {
            _hasErrors = true;
          });
        });
      }

      setState(
        () {
          _loading = false;
        },
      );

      return;
    }

    void cleanForm() {
      setState(() {
        username.text = '';
        password.text = '';
        _hasErrors = false;
        _loading = false;
      });
    }

    /* void signInTapFunction(status) {
      if (_loading != true) {
        setState(() {
          _signInTap = status;
        });
      }
    } */

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
                  child: Column(children: <Widget>[
                    const SizedBox(
                        width: 368, height: 50, child: SecondLogoApp()),
                    Container(
                      width: 368,
                      padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                      child: const Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.2),
                      ),
                    ),
                    Container(
                      width: 368,
                      padding: const EdgeInsets.only(bottom: 60),
                      child: const Text(
                        'Sign in to continue',
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
                            bottom: 30 - (_hasErrors == true ? 9 : 0))),
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
                            bottom: 60 - (_hasErrors == true ? 9 : 0))),
                    CustomButton(
                        width: 368,
                        variant: 'outlined',
                        type: 'primary',
                        event: () => signIn(),
                        loading: _loading,
                        text: 'Sign In'),
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
                              "Don't have an account?",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              cleanForm();
                              Navigator.pushNamed(context, 'signUp');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppTheme.primaryColor),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            );
          }),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
