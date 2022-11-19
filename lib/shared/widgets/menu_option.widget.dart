import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/sensors/services/sensor.service.dart';
import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final AppRoute route;
  final int notifications;

  const MenuOption({
    Key? key,
    this.notifications = 0,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool selected = ModalRoute.of(context)!.settings.name == route.route;

    return SizedBox(
      width: double.infinity,
      height: 65,
      child: InkWell(
        highlightColor: AppTheme.primaryColor.withOpacity(0.3),
        splashColor: AppTheme.primaryColor.withOpacity(0.5),
        child: Center(
          child: ListTile(
            visualDensity: const VisualDensity(horizontal: 0, vertical: 2),
            contentPadding: EdgeInsets.zero,
            selected: selected,
            selectedColor: Colors.black,
            selectedTileColor: AppTheme.primaryColor.withOpacity(0.3),
            title: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                route.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (notifications > 0)
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppTheme.dangerColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        width: 50,
                        height: 25,
                        child: Center(
                          child: Text(
                            '$notifications',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (selected)
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: SizedBox(
                      width: 7,
                      height: 65,
                    ),
                  ),
              ],
            ),
            minLeadingWidth: 0,
          ),
        ),
        onTap: () {
          if (route.service is LightService) {
            (route.service as LightService).getLights();
          } else if (route.service is SensorService) {
            (route.service as SensorService).getSensors();
          }

          if (selected) {
            Navigator.pop(context);
          } else {
            Navigator.pushReplacementNamed(context, route.route);
          }
        },
      ),
    );
  }
}
