import 'dart:async';

import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class AppIntroScreen extends StatelessWidget {
  const AppIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    Timer(const Duration(seconds: 2), (() {
      //Navigator.popAndPushNamed(context, 'signIn');
    }));

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: screenWidth,
            height: screenHeight,
            decoration:
                const BoxDecoration(color: (AppTheme.appBackgroundColor)),
            child: SafeArea(
                child: Column(
              children: [
                SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.9,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/icon-app.png',
                          scale: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              'DOM',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(40, 104, 245, 1),
                                  letterSpacing: -0.4),
                            ),
                            Text(
                              'O',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(199, 69, 69, 1),
                                  letterSpacing: -0.4),
                            ),
                            Text(
                              'TICSOFT',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(40, 104, 245, 1),
                                  letterSpacing: -0.4),
                            )
                          ],
                        ),
                      ]),
                ),
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.05,
                  alignment: Alignment.center,
                  child: const Text('Developed By ManuTeam'),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
