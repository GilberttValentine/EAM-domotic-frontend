import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class LightForm extends StatefulWidget {
  final Function() notifyParent;
  final GlobalKey<FormState> formKey;
  Lights light;

  LightForm({
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
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            initialValue: widget.light.name,
            onSaved: (value) {
              widget.light.name = value!;
              widget.notifyParent();
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
      padding: const EdgeInsets.only(left: 10),
      child: CustomOutlineButton(
        onTap: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            Navigator.pop(context);
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
