import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:eam_domotic_frontend/sensors/services/sensor.service.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({Key? key}) : super(key: key);

  Widget humedad() {
    String hum = sensorservice.getHumedad();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.ac_unit,
                  size: 55,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "21°C",
                    style: TextStyle(
                      fontFamily: AppTheme.poppinsFontFamily,
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Divider(),
          ),
          const Text(
            "79% humidity",
            style: TextStyle(
              fontFamily: AppTheme.poppinsFontFamily,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 25, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sensor',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: AppTheme.poppinsFontFamily,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: humedad(),
            )
          ],
        ),
      ),
    );
  }
}
