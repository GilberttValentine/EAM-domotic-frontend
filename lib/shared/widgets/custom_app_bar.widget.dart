import 'package:flutter/material.dart';
import 'package:string_to_hex/string_to_hex.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 35,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: CircleAvatar(
            backgroundColor: Color(StringToHex.toColor('MT')),
            radius: 22,
            child: const Text(
              'MT',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
