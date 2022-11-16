import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/lights/services/light.service.dart';
import 'package:eam_domotic_frontend/shared/services/snack_bar_provider.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListLights extends StatefulWidget {
  const ListLights({super.key});

  @override
  State<StatefulWidget> createState() => ListLightsState();
}

class ListLightsState extends State<ListLights> {
  @override
  Widget build(BuildContext context) {
    final lightService = Provider.of<LightService>(context);

    if (lightService.isLoading) return const LoadingScreen();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 25, left: 25, bottom: 24),
          child: Text(
            'Lights',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: ListView.builder(
              itemCount: lightService.lights.length,
              itemBuilder: (BuildContext context, int index) {
                return CardLights(lightService.lights[index]);
              },
            ),
          ),
        )
      ],
    );
  }
}
