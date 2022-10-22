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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: widget.lights.color,
      margin: const EdgeInsets.only(
        bottom: 30.0,
        left: 20.0,
        right: 20.0,
      ),
      child: InkWell(
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          width: 50,
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
                  fontWeight: FontWeight.w600,
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
