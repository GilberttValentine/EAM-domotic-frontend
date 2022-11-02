import 'package:eam_domotic_frontend/shared/widgets/buttons/models/button_palette.model.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double? width;
  final double height;
  final String type;
  final bool loading;
  final bool disabled;
  final String variant;
  final String size;
  final Function() event;
  final String text;

  const CustomButton({
    Key? key,
    this.width,
    this.height = 65,
    this.type = '',
    this.loading = false,
    this.disabled = false,
    this.variant = '',
    this.size = '',
    required this.event,
    required this.text,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _loading = false;
  bool _disabled = false;
  bool _tap = false;

  @override
  Widget build(BuildContext context) {
    _loading = widget.loading;
    _disabled = widget.disabled;

    void handleTap(status) {
      if (_loading != true && _disabled != true) {
        setState(() {
          _tap = status;
        });
      }
    }

    ButtonPalette btnTheme = ButtonPalette(type: widget.type);

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(
            color: _disabled == true || _loading == true
                ? btnTheme.disabled.withOpacity(0.09)
                : widget.variant == 'outlined'
                    ? btnTheme.hover
                    : btnTheme.border),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Material(
          borderRadius: BorderRadius.circular(18),
          color: _disabled == true || _loading == true
              ? btnTheme.disabled.withOpacity(0.09)
              : widget.variant == 'outlined'
                  ? Colors.transparent
                  : btnTheme.background,
          child: InkWell(
            highlightColor: (widget.variant == 'outlined'
                    ? btnTheme.background
                    : btnTheme.hover)
                .withOpacity(_disabled == true || _loading == true ? 0 : 0.6),
            splashColor: btnTheme.hover
                .withOpacity(_disabled == true || _loading == true ? 0 : 1),
            onTapDown: (details) {
              handleTap(true);
            },
            onTapCancel: () {
              handleTap(false);
            },
            onTapUp: (details) {
              handleTap(false);
            },
            onTap: onEvent,
            customBorder: RoundedRectangleBorder(
              side: BorderSide(color: btnTheme.border),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (_loading == true)
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          color: _disabled == true || _loading == true
                              ? btnTheme.disabled.withOpacity(0.26)
                              : btnTheme.textHover,
                          strokeWidth: 3),
                    ),
                  if (_loading == false)
                    Text(widget.text,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: _disabled == true
                                ? btnTheme.disabled.withOpacity(0.26)
                                : widget.variant == 'outlined'
                                    ? _tap == true
                                        ? btnTheme.textHover
                                        : btnTheme.text
                                    : btnTheme.textHover))
                ]),
          )),
    );
  }

  void onEvent() {
    if (_loading != true && _disabled != true) {
      setState(() {
        FocusManager.instance.primaryFocus?.unfocus();
        widget.event();
      });
    }
  }
}
