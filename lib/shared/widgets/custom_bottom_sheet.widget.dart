import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {
  static Future<dynamic> showCustomBottomSheet({
    required BuildContext context,
    required Widget body,
    String title = '',
    Widget? aditionalButton,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppTheme.defaultColor.withOpacity(0.7),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: constraints.maxWidth * 0.35,
                    height: 5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SheetTitle(
                      title: title,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 30,
                      ),
                      constraints: BoxConstraints(
                          maxHeight: (constraints.maxHeight * 0.8) - 41 - 65),
                      child: body,
                    ),
                    Row(
                      children: [
                        aditionalButton == null
                            ? const CancelButton()
                            : const Expanded(child: CancelButton()),
                        if (aditionalButton != null)
                          Expanded(child: aditionalButton!),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SheetTitle extends StatelessWidget {
  final String title;

  const SheetTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: CustomOutlineButton(
        color: AppTheme.defaultColor,
        onTapTextColor: Colors.black,
        text: 'Cancel',
        width: MediaQuery.of(context).size.width * 0.5,
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
