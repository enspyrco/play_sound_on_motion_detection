import 'dart:io';

import 'package:rpi_gpio/gpio.dart';
import 'package:rpi_gpio/rpi_gpio.dart';

void main(List<String> arguments) async {
  final gpio = await initialize_RpiGpio();

  print('Waiting for sensor to settle');
  // Waiting 2 seconds for the sensor to initiate
  sleep(Duration(seconds: 2));

  // Associate pin 26 to pir
  final pir = gpio.input(26, Pull.up);

  print('Detecting motion');

  while (true) {
    // Check whether pir is HIGH
    if (await pir.value) {
      print('Motion Detected!');

      // Delay to avoid multiple detection
      sleep(Duration(seconds: 2));
    }

    // While loop delay should be less than detection delay
    sleep(Duration(milliseconds: 100));
  }
}
