import 'package:flutter/material.dart';

class NotificationDescription extends StatelessWidget {
  const NotificationDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        Text(
          'Sint pariatur cupidatat ullamco incididunt eu sunt pariatur eiusmod commodo non deserunt. Nostrud sunt esse excepteur excepteur commodo sint enim incididunt eu ad. Quis id elit quis fugiat dolor. Reprehenderit nostrud nulla quis fugiat sit esse laboris quis do veniam velit duis.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
