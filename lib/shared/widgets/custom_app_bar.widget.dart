import 'package:badges/badges.dart';
import 'package:eam_domotic_frontend/notifications/notifications.module.dart';
import 'package:eam_domotic_frontend/shared/routes/app.routes.dart';
import 'package:eam_domotic_frontend/shared/services/socket_io_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_to_hex/string_to_hex.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final notificationService = Provider.of<NotificationService>(context);

    final socketService = Provider.of<SocketService>(context);
    socketService.pushNotification(notificationService);

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Badge(
          elevation: 0,
          position: const BadgePosition(top: 14, start: 28),
          padding: EdgeInsets.all(
              ModalRoute.of(context)!.settings.name == "notifications"
                  ? 0
                  : notificationService.newNotifications == false
                      ? 0
                      : 6.5),
          badgeContent: const Text(""),
          child: IconButton(
            iconSize: 30,
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: CircleAvatar(
            backgroundColor: Color(StringToHex.toColor('MT')),
            radius: 22,
            child: const Text(
              'MT',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
