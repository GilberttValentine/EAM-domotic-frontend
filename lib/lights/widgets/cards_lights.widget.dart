import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardLights extends StatefulWidget {
  final Lights lights;

  const CardLights(this.lights, {super.key});

  @override
  State<CardLights> createState() => _CardLightsState();
}

class _CardLightsState extends State<CardLights> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: widget.lights.color,
      margin: const EdgeInsets.only(
        right: 25,
        left: 25,
        bottom: 25,
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: () {
          CustomBottomSheet.showCustomBottomSheet(
            context: context,
            title: 'Edit LED',
            body: LightForm(
              formKey: _formKey,
              light: widget.lights,
              notifyParent: refresh,
            ),
            aditionalButton: EditButton(
              formKey: _formKey,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          width: 380,
          height: 120,
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.lights.name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Transform.scale(
                scale: 0.9,
                child: CupertinoSwitch(
                  value: isSwitched,
                  onChanged: (bool isChecked) {
                    setState(
                      () {
                        isSwitched = isChecked;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}
