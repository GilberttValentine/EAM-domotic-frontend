import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

import 'list.lights.dart';

class LightScreen extends StatelessWidget {
  const LightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: ListLights(),
    );
  }
}
