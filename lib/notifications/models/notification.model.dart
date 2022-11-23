class NotificationApp {
  final String _id;
  final String _title;
  final String _message;
  final DateTime _createdAt;
  final DateTime _updatedAt;

  NotificationApp(this._id, this._title,this._message, this._createdAt, this._updatedAt);

  String get getMessage {
    return _message;
  }

  String get getId {
    return _id;
  }

  DateTime get getCreatedAt {
    return _createdAt;
  }

  String get getTitle {
    return _title;
  }

  factory NotificationApp.fromJson(Map<String, dynamic> json) =>
      NotificationApp(
        json["id"],
        json["title"],
        json["message"],
        DateTime.parse(json["created_at"]),
        DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": _id,
        "title": _title,
        "message": _message,
        "created_at": _createdAt.toIso8601String(),
        "updated_at": _updatedAt.toIso8601String(),
      };
}
