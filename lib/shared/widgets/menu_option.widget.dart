import 'package:eam_domotic_frontend/notifications/notifications.module.dart';
import 'package:eam_domotic_frontend/shared/services/socket_io_provider.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuOption extends StatelessWidget {
  final AppRoute route;

  MenuOption({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool selected = ModalRoute.of(context)!.settings.name == route.route;

    final notificationService = Provider.of<NotificationService>(context);
    final socketService = Provider.of<SocketService>(context);
    socketService.pushNotification(notificationService);

    bool notifications = notificationService.newNotifications;

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
                if (route.name == "Notifications" && notifications == true)
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppTheme.dangerColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const SizedBox(
                        width: 40,
                        height: 25,
                        child: Center(
                          child: Text(
                            'new',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
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
          if (route.route == 'notifications') {
            notificationService.getNotifications();
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
