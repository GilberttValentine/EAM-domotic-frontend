import 'dart:convert';

class SensorState {
  final String _id;
  final int _temperature;
  final int _humidity;

  SensorState(this._id, this._temperature, this._humidity);

  String get getId {
    return _id;
  }

  int get getTemperature {
    return _temperature;
  }

  int get getHumidity {
    return _humidity;
  }

  SensorState sensorStateFromJson(String str) =>
      SensorState.fromJson(json.decode(str));

  String sensorStateToJson(SensorState data) => json.encode(data.toJson());

  factory SensorState.fromJson(Map<String, dynamic> json) => SensorState(
        json["id"],
        json["temperature"],
        json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "id": _id,
        "temperature": _temperature,
        "humidity": _humidity,
      };
}
