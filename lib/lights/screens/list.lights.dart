import 'package:eam_domotic_frontend/lights/models/light.model.dart';
import 'package:flutter/cupertino.dart';

import 'cards.lights.dart';

class ListLights extends StatefulWidget {
  const ListLights({super.key});

  @override
  State<StatefulWidget> createState() => ListLightsState();
}

class ListLightsState extends State<ListLights> {
  List<Lights> lights = Lights.listLights();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lights.length,
        itemBuilder: (BuildContext context, int index) {
          return CardLights(lights[index]);
        });
  }
}
