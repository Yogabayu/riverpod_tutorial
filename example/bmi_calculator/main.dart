import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bmi_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Example: BMI CALCULATOR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BmiCalculatorScreen(),
    );
  }
}

class BmiCalculatorScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(bmicalculatorProvider).result;
    final provider = ref.watch(bmicalculatorProvider);
    final tinggiController = ref.read(tinggiProvider);
    final beratController = ref.read(beratProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator BMI'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                controller: tinggiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tinggi badan',
                  hintText: 'Masukkan dalam satuan cm',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: beratController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Berat badan',
                  hintText: 'Masukkan dalam satuan kg',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: CalculatorButton(
                text: 'Hitung >>',
                onPressed: () {
                  provider.bmi(double.parse(tinggiController.text),
                      double.parse(beratController.text));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Hasil: $result',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (double.parse(result) != 0)
              if (double.parse(result) < 18.5)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Berat badan kurang',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
            if (double.parse(result) >= 18.5 && double.parse(result) < 23)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Berat badan normal',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            if (double.parse(result) >= 23 && double.parse(result) < 30)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Berat badan berlebih (kecenderungan obesitas)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            if (double.parse(result) >= 30)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Obesitas',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CalculatorButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
