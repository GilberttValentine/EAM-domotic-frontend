import 'dart:async';

import 'package:eam_domotic_frontend/auth/auth.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:eam_domotic_frontend/shared/widgets/other/first_logo_app.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppIntroScreen extends StatelessWidget {
  const AppIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), (() async {
      final authService = Provider.of<AuthService>(context, listen: false);

      authService.readToken().then(
        (token) {
          if (token == '') {
            Navigator.popAndPushNamed(context, 'signIn');
          } else {
            authService.validateCurrentToken().then((value) {
              if (value) {
                Navigator.popAndPushNamed(context, 'lights');
              } else {
                authService.logout();
                Navigator.popAndPushNamed(context, 'signIn');
              }
            });
          }
        },
      );
    }));

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: AppTheme.appInitialBackgroundColor,
            padding: const EdgeInsets.only(bottom: 25, top: 25),
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.8858,
                    child: const FirstLogoApp(),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.05,
                    alignment: Alignment.center,
                    child: const Text(
                      'Developed By ManuTeam',
                      style: TextStyle(
                          fontSize: 13, color: Color.fromRGBO(0, 0, 0, 0.6)),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
