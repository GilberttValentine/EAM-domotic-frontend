import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class LightForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const LightForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<LightForm> createState() => _LightFormState();
}

class _LightFormState extends State<LightForm> {
  late String _name;

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
            onSaved: (value) => _name = value!,
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
            FocusScope.of(context).unfocus();
          }
        },
        color: AppTheme.primaryHoverColor,
        backgroundColor: AppTheme.primaryColor,
        textColor: Colors.white,
        text: 'Edit',
        width: MediaQuery.of(context).size.width * 0.5,
      ),
    );
  }
}
