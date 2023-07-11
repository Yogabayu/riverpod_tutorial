import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculatorProvider =
    ChangeNotifierProvider<Calculator>((ref) => Calculator());
final num1Provider =
    Provider<TextEditingController>((ref) => TextEditingController());
final num2Provider =
    Provider<TextEditingController>((ref) => TextEditingController());

class Calculator extends ChangeNotifier {
  double _result = 0;

  double get result => _result;

  void zero() {
    _result = 0.0;
    notifyListeners();
  }

  void add(double a, double b) {
    _result = a + b;
    notifyListeners();
  }

  void min(double a, double b) {
    _result = a - b;
    notifyListeners();
  }

  void kali(double a, double b) {
    _result = a * b;
    notifyListeners();
  }

  void bagi(double a, double b) {
    _result = a / b;
    notifyListeners();
  }

  void kuadrat(double a, double exponent) {
    _result = pow(a, exponent) as double;
    notifyListeners();
  }

  void akar(double a, double exponent) {
    _result = pow(a, 1 / exponent) as double;
    notifyListeners();
  }
}
