import 'package:eam_domotic_frontend/notifications/notifications.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';

class LightScreen extends StatelessWidget {
  const LightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('LightScreen'),
          ),
          ElevatedButton(
            child: const Text('Open Sheet'),
            onPressed: () {
              CustomBottomSheet.showCustomBottomSheet(
                context: context,
                title: 'Edit LED',
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const TextField(
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      autofocus: false,
                      cursorColor: AppTheme.primaryColor,
                      decoration: InputDecoration(
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
                aditionalButton: const EditButton(),
              );
            },
          )
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: CustomOutlineButton(
        onTap: () {},
        color: AppTheme.primaryHoverColor,
        backgroundColor: AppTheme.primaryColor,
        textColor: Colors.white,
        text: 'Edit',
        width: MediaQuery.of(context).size.width * 0.5,
      ),
    );
  }
}
