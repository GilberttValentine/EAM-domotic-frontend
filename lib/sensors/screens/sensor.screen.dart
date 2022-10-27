import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:eam_domotic_frontend/sensors/models/sensor.model.dart';
import 'package:eam_domotic_frontend/sensors/services/sensor.service.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({Key? key}) : super(key: key);

  Widget humedad() {
    String hum = sensorservice.getHumedad();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.water_drop,
            size: 80,
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
          Text(
            "hume",
            style: TextStyle(
              fontFamily: AppTheme.poppinsFontFamily,
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 0, 0, 0.6),
            ),
          ),
          Padding(padding: EdgeInsets.all(40)),
          Icon(
            Icons.ac_unit,
            size: 80,
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
          Text(
            "temp",
            style: TextStyle(
              fontFamily: AppTheme.poppinsFontFamily,
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 0, 0, 0.6),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 25),
            child: Text(
              'Sensor',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: AppTheme.poppinsFontFamily,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: humedad(),
          )
        ],
      ),
    );
  }
}
