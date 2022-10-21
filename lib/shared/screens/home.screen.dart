import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Widget body;

  const HomeScreen({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: body,
      resizeToAvoidBottomInset: false,
    );
  }
}
