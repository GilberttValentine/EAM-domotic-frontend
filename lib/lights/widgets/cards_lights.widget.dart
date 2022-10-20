import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:flutter/material.dart';

class CardLights extends StatefulWidget {
  Lights lights;

  CardLights(this.lights, {super.key});

  @override
  State<CardLights> createState() => _CardLightsState();
}

class _CardLightsState extends State<CardLights> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("name" + widget.lights.name)));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: widget.lights.color,
          margin: const EdgeInsets.only(top: 30.0, left: 35.0, right: 35.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            width: 50,
            height: 120,
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.lights.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 23.0),
                ),
                Switch(
                    value: isSwitched,
                    onChanged: (bool isChecked) {
                      setState(() {
                        isSwitched = isChecked;
                      });
                    })
              ],
            ),
          ),
        ));
  }
}
