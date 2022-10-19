import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final double horizontalMargin;
  final double verticalMargin;
  final Color textColor;
  final Color onTapTextColor;
  final Function() onTap;
  final String text;
  final Color backgroundColor;

  const CustomOutlineButton({
    Key? key,
    this.color = AppTheme.primaryColor,
    this.width = 170,
    this.height = 55,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
    this.textColor = Colors.black,
    this.onTapTextColor = Colors.white,
    required this.onTap,
    required this.text,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  State<CustomOutlineButton> createState() => _CustomOutlineButtonState();
}

class _CustomOutlineButtonState extends State<CustomOutlineButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    Color textColor = _pressed ? widget.onTapTextColor : widget.textColor;
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.symmetric(
        horizontal: widget.horizontalMargin,
        vertical: widget.verticalMargin,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: widget.color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(19),
        color: widget.backgroundColor,
        child: InkWell(
          highlightColor: widget.color.withOpacity(0.5),
          splashColor: widget.color,
          onTapDown: (details) {
            setState(() {
              _pressed = true;
            });
          },
          onTapCancel: () {
            setState(() {
              _pressed = false;
            });
          },
          onTapUp: (details) {
            setState(() {
              _pressed = false;
            });
          },
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(19),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
