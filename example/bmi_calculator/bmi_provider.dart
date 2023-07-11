import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bmicalculatorProvider = ChangeNotifierProvider<Bmi>((ref) => Bmi());
final tinggiProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final beratProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

class Bmi extends ChangeNotifier {
  double _result = 0;

  String get result => _result.toStringAsFixed(1);

  void bmi(double tinggi, double berat) {
    double tinggiMeter = tinggi / 100; // Convert tinggi from cm to meter
    _result = berat / (tinggiMeter * tinggiMeter);
    notifyListeners();
  }
}
