import 'package:flutter/material.dart';
import '../../shared/shared.module.dart';

class LightScreen extends StatelessWidget {
  const LightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('LightScreen'),
      ),
    );
  }
}
