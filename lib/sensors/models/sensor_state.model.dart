import 'dart:convert';

class SensorState {
  final String _id;
  int _temperature;
  int _humidity;

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

  set setTemperature(temperature) {
    _temperature = temperature;
  }

  set setHumidity(humidity) {
    _humidity = humidity;
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
