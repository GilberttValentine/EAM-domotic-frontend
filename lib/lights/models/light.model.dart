import 'package:flutter/material.dart';

class Lights {
  late String name;
  late Color color;

  Lights(this.name, this.color);

  static List<Lights> listLights() {
    return [
      Lights("Place1", Colors.white),
      Lights("Place2", Colors.white),
      Lights("Place3", Colors.white),
      Lights("Place4", Colors.white),
      Lights("Place5", Colors.white),
      Lights("Place6", Colors.white)
    ];
  }
}
