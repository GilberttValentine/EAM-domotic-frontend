import 'package:eam_domotic_frontend/auth/auth.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:eam_domotic_frontend/shared/widgets/other/second_logo_app.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Drawer(
          width: constraints.maxWidth * 0.8,
          elevation: 0,
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 35),
                child: Container(
                    transformAlignment: Alignment.center,
                    width: constraints.maxWidth,
                    height: 50,
                    child: const SecondLogoApp(
                      centered: true,
                    )),
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
              SignOutButton(
                constraints: constraints,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignOutButton extends StatelessWidget {
  final BoxConstraints constraints;

  const SignOutButton({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CustomOutlineButton(
          onTap: () async {
            final authService =
                Provider.of<AuthService>(context, listen: false);

            Navigator.pushReplacementNamed(context, 'signIn');
            await authService.logout();
          },
          color: AppTheme.dangerColor,
          height: 65,
          width: constraints.maxWidth,
          horizontalMargin: 35,
          verticalMargin: 40,
          text: 'Sign Out',
          isLoader: true,
        ),
      ),
    );
  }
}
