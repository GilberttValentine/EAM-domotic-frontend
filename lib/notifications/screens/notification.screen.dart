import 'package:eam_domotic_frontend/notifications/notifications.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('NotificationScreen'),
          ),
          ElevatedButton(
            child: const Text('Open Sheet'),
            onPressed: () {
              CustomBottomSheet.showCustomBottomSheet(
                context: context,
                body: const NotificationDescription(),
              );
            },
          )
        ],
      ),
    );
  }
}
