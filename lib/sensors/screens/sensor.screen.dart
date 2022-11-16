import 'package:eam_domotic_frontend/sensors/models/sensor.model.dart';
import 'package:eam_domotic_frontend/sensors/services/sensor.service.dart';
import 'package:eam_domotic_frontend/shared/shared.module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SensorScreen extends StatelessWidget {
  const SensorScreen({Key? key}) : super(key: key);

  Widget sensor(Sensor sensor) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.wb_sunny_outlined,
                  size: 55,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    '${sensor.getSensorState.getTemperature}°C',
                    style: const TextStyle(
                      fontFamily: AppTheme.poppinsFontFamily,
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Container(
              height: 2,
              color: Colors.black.withOpacity(0.15),
            ),
          ),
          Text(
            '${sensor.getSensorState.getHumidity}% humidity',
            style: const TextStyle(
              fontFamily: AppTheme.poppinsFontFamily,
              fontSize: 17,
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
    final sensorService = Provider.of<SensorService>(context);

    if (sensorService.isLoading) return const LoadingScreen();

    return HomeScreen(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 25, bottom: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Sensors',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: AppTheme.poppinsFontFamily,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: sensor(sensorService.sensorList[0]),
            )
          ],
        ),
      ),
    );
  }
}
