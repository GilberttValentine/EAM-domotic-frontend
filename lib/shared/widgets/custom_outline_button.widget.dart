import 'dart:async';

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
  final bool isLoader;

  const CustomOutlineButton({
    Key? key,
    this.color = AppTheme.primaryColor,
    this.width = 170,
    this.height = 55,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
    this.textColor = Colors.black,
    this.onTapTextColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.isLoader = false,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  State<CustomOutlineButton> createState() => _CustomOutlineButtonState();
}

class _CustomOutlineButtonState extends State<CustomOutlineButton> {
  bool _pressed = false;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
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
        color: _loading ? widget.color : widget.backgroundColor,
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
          onTap: widget.isLoader ? onButtonTap : widget.onTap,
          borderRadius: BorderRadius.circular(19),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_loading == true)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 3),
                  ),
                Padding(
                  padding: EdgeInsets.only(
                      left: _loading == true ? 10 : 0,
                      right: _loading == true ? 30 : 0),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          _pressed ? widget.onTapTextColor : widget.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onButtonTap() {
    if (_loading != true) {
      setState(() {
        _loading = true;
        _pressed = true;
        FocusManager.instance.primaryFocus?.unfocus();
        Timer(
          const Duration(seconds: 2),
          (() {
            widget.onTap();
            setState(() {
              _loading = false;
              _pressed = false;
            });
          }),
        );
      });
    }
  }
}
