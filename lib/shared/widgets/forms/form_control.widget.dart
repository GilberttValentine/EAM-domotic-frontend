import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class FormControl extends StatefulWidget {
  final TextEditingController? controller;
  final double? width;
  final bool hasErrors;
  final String placeholder;
  final String type;
  final Function() event;

  const FormControl({
    Key? key,
    this.controller,
    this.width,
    this.type = 'text',
    this.hasErrors = false,
    this.placeholder = '',
    required this.event,
  }) : super(key: key);

  @override
  State<FormControl> createState() => _FormControlState();
}

class _FormControlState extends State<FormControl> {
  bool _hasErrors = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    _hasErrors = widget.hasErrors;
    if (widget.type != 'password') {
      _isObscure = false;
    }

    return SizedBox(
      width: widget.width,
      child: TextField(
          style: const TextStyle(fontSize: 16),
          obscureText: _isObscure,
          obscuringCharacter: '•',
          controller: widget.controller,
          autofocus: false,
          cursorColor: AppTheme.primaryColor,
          onTap: widget.event,
          decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 0),
              errorText: _hasErrors == true ? '' : null,
              contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: widget.placeholder,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: AppTheme.primaryColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              suffixIcon: widget.type == 'password'
                  ? IconButton(
                      color: Colors.grey,
                      icon: Icon(_isObscure == true
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(
                          () {
                            _isObscure = !_isObscure;
                          },
                        );
                      },
                    )
                  : null)),
    );
  }
}
