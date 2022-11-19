import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/shared/services/socket_io_provider.dart';
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

    final socketService = Provider.of<SocketService>(context);
    socketService.getLights(lightService);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Lights',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              /* IconButton(
                icon: const Icon(Icons.replay),
                tooltip: 'Reload',
                onPressed: () {
                  lightService.getLights();
                  setState(() {});
                },
              ), */
            ],
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
