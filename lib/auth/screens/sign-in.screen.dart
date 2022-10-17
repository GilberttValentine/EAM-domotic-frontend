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
  bool passwordHasFocused = false;
  bool signInTap = false;

  bool hasErrors = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    void showSnackBar(String message, String status) {
      var snackBar = SnackBar(
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
        passwordHasFocused = false;
        signInTap = false;
        hasErrors = false;
        loading = false;
      });
    }

    void signInTapFunction(status) {
      if (loading != true) {
        setState(() {
          signInTap = status;
        });
      }
    }

    void signIn() async {
      if (loading != true) {
        setState(() {
          signInTap = true;
          loading = true;
          passwordHasFocused = false;
          hasErrors = false;
          FocusManager.instance.primaryFocus?.unfocus();
        });

        Timer(const Duration(seconds: 2), (() {
          if (username.text == '' || password.text == '') {
            showSnackBar('Invalid credentials', 'failed');
            setState(() {
              hasErrors = true;
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
                hasErrors = true;
              });
            }
          }

          setState(() {
            loading = false;
            signInTap = false;
          });
        }));
      }

      return;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
            width: screenWidth,
            height: screenHeight,
            decoration:
                const BoxDecoration(color: AppTheme.appInitialBackgroundColor),
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 50),
              child: Column(children: <Widget>[
                SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.062,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
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
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontSize: 28,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.2),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Sign in to continue',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            letterSpacing: -0.2),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 5),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )),
                TextField(
                  style: const TextStyle(fontSize: 16),
                  controller: username,
                  autofocus: false,
                  cursorColor: AppTheme.primaryColor,
                  onTap: () {
                    setState(() {
                      hasErrors = false;
                      passwordHasFocused = false;
                    });
                  },
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0),
                      errorText: hasErrors == true ? '' : null,
                      contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Username',
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: AppTheme.primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: hasErrors == true ? 31 : 40, bottom: 5),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(bottom: hasErrors == true ? 41 : 50),
                    child: TextField(
                      style: const TextStyle(fontSize: 16),
                      obscureText: _isObscure,
                      controller: password,
                      obscuringCharacter: '•',
                      cursorColor: AppTheme.primaryColor,
                      onTap: () {
                        setState(() {
                          hasErrors = false;
                          passwordHasFocused = true;
                        });
                      },
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(fontSize: 0),
                        errorText: hasErrors == true ? '' : null,
                        contentPadding:
                            const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: 'Password',
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2, color: AppTheme.primaryColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        suffixIcon: IconButton(
                          color: Colors.grey,
                          icon: Icon(_isObscure == true
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: constraints.maxWidth,
                      height: 65,
                      decoration: BoxDecoration(
                        color: loading == true
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
                                  borderRadius: BorderRadius.circular(17)),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  if (loading == true)
                                    const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                          color: Colors.white, strokeWidth: 3),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: loading == true ? 10 : 0,
                                        right: loading == true ? 30 : 0),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: signInTap == true
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  )
                                ],
                              )))),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Text(
                      'Don’t have an account?',
                      style: TextStyle(),
                    ),
                    InkWell(
                        onTap: () {
                          cleanForm();
                          Navigator.pushNamed(context, 'signUp');
                        },
                        child: const Text(
                          'Create a new account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryColor),
                        ))
                  ],
                )
              ]),
            )),
          );
        }));
  }
}
