import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class ListLights extends StatefulWidget {
  const ListLights({super.key});

  @override
  State<StatefulWidget> createState() => ListLightsState();
}

class ListLightsState extends State<ListLights> {
  List<Lights> lights = Lights.listLights();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, bottom: 25),
          child: Text(
            'Lights',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: lights.length,
            itemBuilder: (BuildContext context, int index) {
              return CardLights(lights[index]);
            },
          ),
        ),
      ],
    );
  }
}
