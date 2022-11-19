class NotificationApp {
  final String _id;
  final String _message;
  final DateTime _createdAt;
  final DateTime _updatedAt;

  NotificationApp(this._id, this._message, this._createdAt, this._updatedAt);

  String get getMessage {
    return _message;
  }

  String get getId {
    return _id;
  }

  DateTime get getCreatedAt {
    return _createdAt;
  }

  factory NotificationApp.fromJson(Map<String, dynamic> json) =>
      NotificationApp(
        json["id"],
        json["message"],
        DateTime.parse(json["created_at"]),
        DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": _id,
        "message": _message,
        "created_at": _createdAt.toIso8601String(),
        "updated_at": _updatedAt.toIso8601String(),
      };
}
