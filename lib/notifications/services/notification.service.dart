import 'package:eam_domotic_frontend/notifications/models/notification.model.dart';

class NotificationService{

  // Mocked elements to test
  static List<NotificationApp> getNotifications() {
    return [
      NotificationApp(
        title: 'Kitchen', 
        description: 'Lorem ipsum dolor sit amet, consectetur adipisc elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
        receivedAt: DateTime.now()
      ),
      NotificationApp(
        title: 'Room', 
        description: 'Lorem ipsum dolor sit amet, consectetur adipisc elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
        receivedAt: DateTime.now()
      ),
      NotificationApp(
        title: 'Garage', 
        description: 'Lorem ipsum dolor sit amet, consectetur adipisc elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
        receivedAt: DateTime.now()
      ),
      NotificationApp(
        title: 'Courtyard', 
        description: 'Lorem ipsum dolor sit amet, consectetur adipisc elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
        receivedAt: DateTime.now()
      ),
      NotificationApp(
        title: 'Attic', 
        description: 'Lorem ipsum dolor sit amet, consectetur adipisc elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim', 
        receivedAt: DateTime.now()
      )
    ];
  }
}