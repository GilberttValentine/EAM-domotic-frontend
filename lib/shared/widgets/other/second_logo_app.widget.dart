import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/cupertino.dart';

class SecondLogoApp extends StatelessWidget {
  final bool centered;
  const SecondLogoApp({Key? key, this.centered = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: centered == true
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
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
        ]);
  }
}
