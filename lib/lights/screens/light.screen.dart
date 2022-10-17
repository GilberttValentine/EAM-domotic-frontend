import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class LightScreen extends StatelessWidget {
  const LightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('LightScreen'),
          ),
          ElevatedButton(
            child: const Text('Open Sheet'),
            onPressed: () {
              CustomDraggableBottomSheet.showCustomDraggableBottomSheet(
                context,
              );
            },
          )
        ],
      ),
    );
  }
}
