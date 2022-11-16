import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/lights/services/light.service.dart';
import 'package:eam_domotic_frontend/shared/services/snack_bar_provider.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:eam_domotic_frontend/shared/widgets/forms/label.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LightForm extends StatefulWidget {
  final Function() notifyParent;
  final GlobalKey<FormState> formKey;
  final Led light;

  const LightForm({
    Key? key,
    required this.formKey,
    required this.light,
    required this.notifyParent,
  }) : super(key: key);

  @override
  State<LightForm> createState() => _LightFormState();
}

class _LightFormState extends State<LightForm> {
  @override
  Widget build(BuildContext context) {
    final lightService = Provider.of<LightService>(context);

    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Label(label: 'Name'),
          TextFormField(
            initialValue: widget.light.getLocation.getName,
            onSaved: (value) {
              widget.light.getLocation.setName = value!;
              lightService.updateLightLocation(widget.light.getLocation).then(
                (value) {
                  Navigator.pop(context);
                  widget.notifyParent();
                },
              ).onError((error, stackTrace) {
                SnackBarProvider(
                  context: context,
                  message: error.toString(),
                  status: 'error',
                );
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            style: const TextStyle(
              fontSize: 16,
            ),
            autofocus: false,
            cursorColor: AppTheme.primaryColor,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: AppTheme.primaryColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const EditButton({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9),
      child: CustomOutlineButton(
        onTap: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          }
        },
        color: AppTheme.primaryHoverColor,
        backgroundColor: AppTheme.primaryColor,
        textColor: Colors.white,
        text: 'Edit',
        width: MediaQuery.of(context).size.width * 0.5,
        isLoader: true,
      ),
    );
  }
}
