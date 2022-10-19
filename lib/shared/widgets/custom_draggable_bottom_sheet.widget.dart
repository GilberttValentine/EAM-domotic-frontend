import 'package:eam_domotic_frontend/shared/shared.module.dart';
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
          expand: false,
          initialChildSize: 0.4,
          maxChildSize: 0.9,
          minChildSize: 0.35,
          builder: (context, scrollController) => LayoutBuilder(
            builder: (context, constraints) => Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(35),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 26,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: const [
                          Text(
                            'Occaecat ea aliquip laborum cupidatat ea in ad ad mollit incididunt quis sunt. Cupidatat anim aliquip tempor ex officia ipsum fugiat esse nostrud est ut enim adipisicing. Elit ipsum cillum esse velit qui voluptate et qui eu. Minim consectetur eiusmod incididunt deserunt quis labore voluptate. Cillum laboris anim cupidatat irure et exercitation qui irure irure. Quis Lorem sit non excepteur. Excepteur ex consequat duis proident veniam exercitation irure enim mollit. Est id enim excepteur Lorem exercitation laboris tempor incididunt. Nisi consectetur officia nulla aliqua magna non aute sit. Dolor Lorem sint aliqua veniam excepteur sunt dolor culpa nulla adipisicing est qui minim qui. Do nisi culpa do sit sint laboris incididunt enim mollit nisi officia. Sint minim reprehenderit proident veniam id labore dolore est ex. Esse ea elit do cillum. Labore labore sint in nulla.Occaecat ea aliquip laborum cupidatat ea in ad ad mollit incididunt quis sunt. Cupidatat anim aliquip tempor ex officia ipsum fugiat esse nostrud est ut enim adipisicing. Elit ipsum cillum esse velit qui voluptate et qui eu. Minim consectetur eiusmod incididunt deserunt quis labore voluptate. Cillum laboris anim cupidatat irure et exercitation qui irure irure. Quis Lorem sit non excepteur. Excepteur ex consequat duis proident veniam exercitation irure enim mollit. Est id enim excepteur Lorem exercitation laboris tempor incididunt. Nisi consectetur officia nulla aliqua magna non aute sit. Dolor Lorem sint aliqua veniam excepteur sunt dolor culpa nulla adipisicing est qui minim qui. Do nisi culpa do sit sint laboris incididunt enim mollit nisi officia. Sint minim reprehenderit proident veniam id labore dolore est ex. Esse ea elit do cillum. Labore labore sint in nulla.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: const Divider(),
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: CustomOutlineButton(
                                color: AppTheme.defaultColor,
                                onTapTextColor: Colors.black,
                                text: 'Cancel',
                                width: constraints.maxWidth * 0.5,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomOutlineButton(
                                onTap: () {},
                                color: AppTheme.primaryHoverColor,
                                backgroundColor: AppTheme.primaryColor,
                                textColor: Colors.white,
                                text: 'Edit',
                                width: constraints.maxWidth * 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

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
