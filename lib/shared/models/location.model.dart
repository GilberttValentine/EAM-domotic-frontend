import 'dart:convert';

class Location {
  final String _id;
  String _name;

  Location(this._id, this._name);

  String get getId {
    return _id;
  }

  String get getName {
    return _name;
  }

  set setName(String name) {
    _name = name;
  }

  Location locationFromJson(String str) => Location.fromJson(json.decode(str));

  String locationToJson(Location data) => json.encode(data.toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        json["id"],
        json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": _id,
        "name": _name,
      };
}
