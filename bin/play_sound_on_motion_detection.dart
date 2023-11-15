import 'package:rpi_gpio/rpi_gpio.dart';

void main(List<String> arguments) async {
  final gpio = await initialize_RpiGpio();

  final led = gpio.output(15);
  final pwmLed = gpio.pwm(12);
}
