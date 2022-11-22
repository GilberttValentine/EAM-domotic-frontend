import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/shared/services/snack_bar_provider.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardLights extends StatefulWidget {
  final Led lights;

  const CardLights(this.lights, {super.key});

  @override
  State<CardLights> createState() => _CardLightsState();
}

class _CardLightsState extends State<CardLights> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    isSwitched = widget.lights.getLedState.getOn;
    return Card(
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
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
                widget.lights.getLocation.getName,
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
                  onChanged: (bool isChecked) async {
                    final authService =
                        Provider.of<LightService>(context, listen: false);

                    await authService
                        .updateLightState(widget.lights.getId, isChecked)
                        .then((value) {
                      widget.lights.getLedState.setOn = isChecked;
                      setState(() {
                        isSwitched = isChecked;
                      });
                    }).onError((error, stackTrace) {
                      SnackBarProvider(
                        context: context,
                        message: error.toString(),
                        status: 'error',
                      );
                      setState(() {
                        isSwitched = !isChecked;
                      });
                    });
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
