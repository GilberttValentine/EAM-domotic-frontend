import 'package:flutter/material.dart';

class CustomDraggableBottomSheet {
  static Future<dynamic> showCustomDraggableBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => buildSheet(context: context),
      );

  static Widget buildSheet({required BuildContext context}) => makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        maxChildSize: 0.9,
        minChildSize: 0.25,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(35),
          child: ListView(
            shrinkWrap: true,
            controller: scrollController,
            children: const [
              Text(
                'Laborum ad Lorem nostrud consectetur irure aliqua ea id nisi nulla occaecat et do. Amet laborum qui ut adipisicing Lorem nostrud reprehenderit ea duis consectetur aliqua. Ex excepteur cupidatat aute ad amet qui dolor.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ));

  static Widget makeDismissible(
          {required Widget child, required BuildContext context}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
}
