import 'dart:math';

class Manipulate {
  double generateDouble(double minValue, double maxValue, int precision) {
    final random = Random();
    final doubleRandom = minValue + (maxValue - minValue) * random.nextDouble();
    return double.parse(doubleRandom.toStringAsFixed(precision));
  }
}
