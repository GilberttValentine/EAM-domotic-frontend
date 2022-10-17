import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) => Drawer(
        width: constrains.maxWidth * 0.8,
        elevation: 0,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: Text('DOMOTICSOFT'),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => MenuOption(
                  route: AppRoutes.routes[index],
                ),
                itemCount: AppRoutes.routes.length,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomOutlineButton(
                    color: AppTheme.dangerColor,
                    height: 65,
                    width: constrains.maxWidth,
                    horizontalMargin: 35,
                    verticalMargin: 40,
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
