import 'package:eam_domotic_frontend/notifications/notifications.module.dart';
import 'package:eam_domotic_frontend/shared/services/socket_io_provider.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final Widget body;

  const HomeScreen({Key? key, required this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final notificationService = Provider.of<NotificationService>(context);
    final socketService = Provider.of<SocketService>(context);

    socketService.pushNotification(notificationService);
    bool notifications = notificationService.newNotifications;

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: body,
      resizeToAvoidBottomInset: false,
      floatingActionButton:
          ModalRoute.of(context)!.settings.name == "notifications" &&
                  notifications == true
              ? FloatingActionButton(
                  tooltip: 'Reload',
                  backgroundColor: AppTheme.primaryColor,
                  child: const Icon(Icons.replay),
                  onPressed: () {
                    notificationService.getNotifications();
                  },
                )
              : null,
    );
  }
}
