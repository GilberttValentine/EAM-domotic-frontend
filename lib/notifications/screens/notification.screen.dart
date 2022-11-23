import 'package:eam_domotic_frontend/notifications/notifications.module.dart';
import 'package:eam_domotic_frontend/shared/services/snack_bar_provider.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationService notificationService;

  removeNotification(index) {
    notificationService.deleteAlarm(index).then((value) {
      if (value) {
        notificationService.notifications.removeAt(index);
        setState(() {});
      } else {
        SnackBarProvider(
            context: context,
            message: 'An error has occurred',
            status: 'error');
        notificationService.notifications
            .add(notificationService.notifications.removeAt(index));
        setState(() {});
      }
    });
  }

  String calculateTime(DateTime recived) {
    Duration diff = DateTime.now().difference(recived);
    if (diff.inMinutes > 60) {
      if (diff.inHours > 24) {
        if (diff.inDays > 1) {
          return "${diff.inDays} d";
        } else {
          return "${diff.inDays} d";
        }
      } else {
        if (diff.inHours > 1) {
          return "${diff.inHours} h";
        } else {
          return "${diff.inHours} h";
        }
      }
    } else {
      if (diff.inMinutes > 1) {
        return "${diff.inMinutes} m";
      } else {
        return "now";
      }
    }
  }

  Widget notificationsList() {
    notificationService.newNotifications = false;
    if (notificationService.notifications.isEmpty) {
      return noNotifications();
    } else {
      return showList();
    }
  }

  Widget noNotifications() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          RotationTransition(
            turns: AlwaysStoppedAnimation(-10 / 360),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 100,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "You don't have any notification",
            style: TextStyle(
              fontFamily: AppTheme.poppinsFontFamily,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 0, 0, 0.6),
            ),
          )
        ],
      ),
    );
  }

  Widget showList() {
    return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              offset: Offset(0, 5),
              blurRadius: 15,
              spreadRadius: 0,
            )
          ],
        ),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView.builder(
            itemCount: notificationService.notifications.length,
            padding: const EdgeInsets.only(right: 25, left: 25, bottom: 10),
            itemBuilder: (BuildContext ctx, int index) {
              return rowItem(context, index);
            },
          ),
        ));
  }

  Widget rowItem(context, index) {
    return Dismissible(
      key: Key(notificationService.notifications[index].getId),
      onDismissed: (direction) {
        removeNotification(index);
      },
      secondaryBackground: deleteRigth(),
      background: deleteLeft(),
      child: notificationCard(context, index),
    );
  }

  Widget deleteLeft() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(235, 83, 83, 1),
      ),
      child: const Center(
        child: Text(
          'Discard',
          style: TextStyle(
              fontFamily: AppTheme.poppinsFontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
      ),
    );
  }

  Widget deleteRigth() {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(235, 83, 83, 1),
      ),
      child: const Center(
        child: Text(
          'Discard',
          style: TextStyle(
              fontFamily: AppTheme.poppinsFontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
      ),
    );
  }

  Widget notificationCard(context, index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 140,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: InkWell(
        onTap: () => CustomBottomSheet.showCustomBottomSheet(
          context: context,
          title: notificationService.notifications[index].getTitle,
          body: NotificationDescription(
            description: notificationService.notifications[index].getMessage,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    notificationService.notifications[index].getTitle,
                    style: const TextStyle(
                        fontFamily: AppTheme.poppinsFontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 7),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: Icon(Icons.circle,
                        color: Colors.black.withOpacity(0.9), size: 6.5),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    calculateTime(
                        notificationService.notifications[index].getCreatedAt),
                    style: const TextStyle(
                        fontFamily: AppTheme.poppinsFontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notificationService.notifications[index].getMessage,
                  style: const TextStyle(
                      fontFamily: AppTheme.poppinsFontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    notificationService = Provider.of<NotificationService>(context);

    if (notificationService.isLoading) {
      return const LoadingScreen();
    }

    return HomeScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 24),
            child: Text(
              'Notifications',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: AppTheme.poppinsFontFamily,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: notificationsList(),
          )
        ],
      ),
    );
  }
}
