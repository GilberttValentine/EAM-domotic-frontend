import 'dart:convert';

class LedState {
  final String _id;
  final String _color;
  bool _on;

  LedState(this._id, this._color, this._on);

  String get getId {
    return _id;
  }

  String get getColor {
    return _color;
  }

  bool get getOn {
    return _on;
  }

  set setOn(bool on) {
    _on = on;
  }

  LedState ledStateFromJson(String str) => LedState.fromJson(json.decode(str));

  String ledStateToJson(LedState data) => json.encode(data.toJson());

  factory LedState.fromJson(Map<String, dynamic> json) => LedState(
        json["id"],
        json["color"],
        json["on"],
      );

  Map<String, dynamic> toJson() => {
        "id": _id,
        "color": _color,
        "on": _on,
      };
}
