import 'dart:convert';

import 'package:eam_domotic_frontend/lights/light.module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';

class Led {
  final String _id;
  final String _name;
  final int _number;
  final Location _location;
  final LedState _ledState;
  final Dispositive _dispositive;

  Led(this._id, this._name, this._number, this._location, this._ledState,
      this._dispositive);

  String get getId {
    return _id;
  }

  String get getName {
    return _name;
  }

  int get getNumber {
    return _number;
  }

  Location get getLocation {
    return _location;
  }

  LedState get getLedState {
    return _ledState;
  }

  Dispositive get getDispositive {
    return _dispositive;
  }

  Led ledFromJson(String str) => Led.fromJson(json.decode(str));

  String ledToJson(Led data) => json.encode(data.toJson());

  factory Led.fromJson(Map<String, dynamic> json) => Led(
        json["id"],
        json["name"],
        json["number"],
        Location.fromJson(json["location"]),
        LedState.fromJson(json["ledState"]),
        Dispositive.fromJson(json["dispositive"]),
      );

  Map<String, dynamic> toJson() => {
        "id": _id,
        "name": _name,
        "number": _number,
        "dispositive": _dispositive.toJson(),
        "ledState": _ledState.toJson(),
        "location": _location.toJson(),
      };
}
