import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Drawer(
        width: constraints.maxWidth * 0.8,
        elevation: 0,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 140,
                width: double.infinity,
                child: Center(
                  child: SizedBox(
                    height: constraints.maxHeight * 0.062,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
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
                      ],
                    ),
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ...AppRoutes.routes.map((route) => route.drawerNavigable
                      ? MenuOption(
                          route: route,
                        )
                      : const SizedBox.shrink()),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomOutlineButton(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, 'signIn'),
                    color: AppTheme.dangerColor,
                    height: 65,
                    width: constraints.maxWidth,
                    horizontalMargin: 35,
                    verticalMargin: 40,
                    text: 'Sign Out',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
