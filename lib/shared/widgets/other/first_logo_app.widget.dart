import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/cupertino.dart';

class FirstLogoApp extends StatelessWidget {
  const FirstLogoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    fontFamily: AppTheme.logoFontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(40, 104, 245, 1),
                    letterSpacing: -0.4),
              ),
              Text(
                'O',
                style: TextStyle(
                    fontFamily: AppTheme.logoFontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(199, 69, 69, 1),
                    letterSpacing: -0.4),
              ),
              Text(
                'TICSOFT',
                style: TextStyle(
                    fontFamily: AppTheme.logoFontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(40, 104, 245, 1),
                    letterSpacing: -0.4),
              )
            ],
          ),
        ]);
  }
}
