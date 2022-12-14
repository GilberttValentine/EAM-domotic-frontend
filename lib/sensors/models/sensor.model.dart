import 'dart:convert';

import 'package:eam_domotic_frontend/sensors/sensors_module.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';

class Sensor {
  final String _id;
  final String _name;
  final int _number;
  final Dispositive _dispositive;
  final SensorState _sensorState;
  final Location _location;

  Sensor(this._id, this._name, this._number, this._dispositive,
      this._sensorState, this._location);

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

  SensorState get getSensorState {
    return _sensorState;
  }

  Dispositive get getDispositive {
    return _dispositive;
  }

  Sensor sensorFromJson(String str) => Sensor.fromJson(json.decode(str));

  String sensorToJson(Sensor data) => json.encode(data.toJson());

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        json["id"],
        json["name"],
        json["number"],
        Dispositive.fromJson(json["dispositive"]),
        SensorState.fromJson(json["sensorState"]),
        Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": _id,
        "name": _name,
        "number": _number,
        "dispositive": _dispositive.toJson(),
        "sensorState": _sensorState.toJson(),
        "location": _location.toJson(),
      };
}
