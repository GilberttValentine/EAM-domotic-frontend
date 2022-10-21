import 'dart:async';

import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _isObscure = true;
  bool _signInTap = false;

  bool _hasErrors = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    void showSnackBar(String message, String status) {
      final snackBar = SnackBar(
        backgroundColor: status == 'failed'
            ? AppTheme.dangerColor
            : AppTheme.defaultSnackBarColor,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: const TextStyle(
              fontFamily: AppTheme.poppinsFontFamily, fontSize: 14),
        ),
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void cleanForm() {
      setState(() {
        username.text = '';
        password.text = '';
        _signInTap = false;
        _hasErrors = false;
        _loading = false;
      });
    }

    void signInTapFunction(status) {
      if (_loading != true) {
        setState(() {
          _signInTap = status;
        });
      }
    }

    void signIn() async {
      if (_loading != true) {
        setState(() {
          _signInTap = true;
          _loading = true;
          _hasErrors = false;
          FocusManager.instance.primaryFocus?.unfocus();
        });

        Timer(
          const Duration(seconds: 2),
          (() {
            if (username.text == '' || password.text == '') {
              showSnackBar('Invalid credentials', 'failed');
              setState(() {
                _hasErrors = true;
              });
            } else {
              if (username.text == 'GilberttValentine' &&
                  password.text == 'manuteam2022') {
                showSnackBar('Welcome Back ${username.text}', 'success');
                Navigator.popAndPushNamed(context, 'lights');
              } else {
                showSnackBar('Invalid credentials', 'failed');
                setState(() {
                  password.text = '';
                  _hasErrors = true;
                });
              }
            }

            setState(
              () {
                _loading = false;
                _signInTap = false;
              },
            );
          }),
        );
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
                  padding: const EdgeInsets.fromLTRB(25, 40, 25, 40),
                  child: Column(children: <Widget>[
                    SizedBox(
                      width: 392.72727272727275,
                      height: constraints.maxHeight * 0.062,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Image.asset(
                                'assets/icons/icon-app.png',
                              ),
                            ),
                            const Text(
                              'DOM',
                              style: TextStyle(
                                  fontFamily: AppTheme.logoFontFamily,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(40, 104, 245, 1),
                                  letterSpacing: -0.4),
                            ),
                            const Text(
                              'O',
                              style: TextStyle(
                                  fontFamily: AppTheme.logoFontFamily,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(199, 69, 69, 1),
                                  letterSpacing: -0.4),
                            ),
                            const Text(
                              'TICSOFT',
                              style: TextStyle(
                                  fontFamily: AppTheme.logoFontFamily,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(40, 104, 245, 1),
                                  letterSpacing: -0.4),
                            )
                          ]),
                    ),
                    Container(
                      width: 392.72727272727275,
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                      child: const Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontSize: 28,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.2),
                      ),
                    ),
                    Container(
                      width: 392.72727272727275,
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Sign in to continue',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.2),
                      ),
                    ),
                    Container(
                      width: 392.72727272727275,
                      padding: const EdgeInsets.only(top: 40, bottom: 5),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 392.72727272727275,
                      child: TextField(
                        style: const TextStyle(fontSize: 16),
                        controller: username,
                        autofocus: false,
                        cursorColor: AppTheme.primaryColor,
                        onTap: () {
                          setState(() {
                            _hasErrors = false;
                          });
                        },
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(fontSize: 0),
                          errorText: _hasErrors == true ? '' : null,
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: 'Username',
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: AppTheme.primaryColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 392.72727272727275,
                      padding: EdgeInsets.only(
                          top: 30 - (_hasErrors == true ? 9 : 0), bottom: 5),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 392.72727272727275,
                      padding: EdgeInsets.only(
                        bottom: 50 - (_hasErrors == true ? 9 : 0),
                      ),
                      child: TextField(
                        style: const TextStyle(fontSize: 16),
                        obscureText: _isObscure,
                        controller: password,
                        obscuringCharacter: '•',
                        cursorColor: AppTheme.primaryColor,
                        onTap: () {
                          setState(() {
                            _hasErrors = false;
                          });
                        },
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(fontSize: 0),
                          errorText: _hasErrors == true ? '' : null,
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: 'Password',
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: AppTheme.primaryColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          suffixIcon: IconButton(
                            color: Colors.grey,
                            icon: Icon(_isObscure == true
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: () {
                              setState(
                                () {
                                  _isObscure = !_isObscure;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        width: 392.72727272727275,
                        height: 65,
                        decoration: BoxDecoration(
                          color: _loading == true
                              ? AppTheme.primaryHoverColor
                              : Colors.white,
                          border: Border.all(color: AppTheme.primaryHoverColor),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTapCancel: () {
                              signInTapFunction(false);
                            },
                            onTapUp: (details) {
                              signInTapFunction(false);
                            },
                            onTapDown: (details) {
                              signInTapFunction(true);
                            },
                            onTap: () {
                              signIn();
                            },
                            highlightColor:
                                AppTheme.primaryHoverColor.withOpacity(0.6),
                            splashColor:
                                AppTheme.primaryHoverColor.withOpacity(0.8),
                            customBorder: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: AppTheme.primaryHoverColor),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  if (_loading == true)
                                    const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                          color: Colors.white, strokeWidth: 3),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: _loading == true ? 10 : 0,
                                        right: _loading == true ? 30 : 0),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: _signInTap == true
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 392.72727272727275,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: const Text(
                              "Don't have an account?",
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
