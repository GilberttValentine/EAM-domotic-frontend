import 'dart:convert';

class Dispositive {
  final String _id;
  final String _name;
  final String _type;

  Dispositive(this._id, this._name, this._type);

  String get getId {
    return _id;
  }

  String get getName {
    return _name;
  }

  String get getType {
    return _type;
  }

  Dispositive dispositiveFromJson(String str) =>
      Dispositive.fromJson(json.decode(str));

  String dispositiveToJson(Dispositive data) => json.encode(data.toJson());

  factory Dispositive.fromJson(Map<String, dynamic> json) => Dispositive(
        json["id"],
        json["name"],
        json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": _id,
        "name": _name,
        "type": _type,
      };
}
