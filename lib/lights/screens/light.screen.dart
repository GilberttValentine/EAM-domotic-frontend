import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class LightScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LightScreen({Key? key}) : super(key: key);

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
              CustomBottomSheet.showCustomBottomSheet(
                context: context,
                title: 'Edit LED',
                body: LightForm(
                  formKey: _formKey,
                ),
                aditionalButton: EditButton(
                  formKey: _formKey,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
