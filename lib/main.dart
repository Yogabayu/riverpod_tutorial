import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calculator_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculator = ref.watch(calculatorProvider).result;
    final num1Controller = ref.read(num1Provider);
    final num2Controller = ref.read(num2Provider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Angka Pertama',
                  hintText: 'Angka Pertama',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Angka Kedua',
                  hintText: 'Angka Kedua',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: CalculatorButtons(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Hasil: $calculator',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButtons extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculator = ref.read(calculatorProvider);
    final num1Value = ref.read(num1Provider).text;
    final num2Value = ref.read(num2Provider).text;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalculatorButton(
              text: '+',
              onPressed: () {
                calculator.add(
                    double.parse(num1Value), double.parse(num2Value));
              },
            ),
            SizedBox(width: 20),
            CalculatorButton(
              text: '-',
              onPressed: () {
                calculator.min(
                    double.parse(num1Value), double.parse(num2Value));
              },
            ),
            SizedBox(
              width: 20,
            ),
            CalculatorButton(
              text: '√',
              onPressed: () {
                calculator.akar(
                    double.parse(num1Value), double.parse(num2Value));
              },
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalculatorButton(
              text: '*',
              onPressed: () {
                calculator.kali(
                    double.parse(num1Value), double.parse(num2Value));
              },
            ),
            SizedBox(width: 20),
            CalculatorButton(
              text: '/',
              onPressed: () {
                calculator.bagi(
                    double.parse(num1Value), double.parse(num2Value));
              },
            ),
            SizedBox(width: 20),
            CalculatorButton(
              text: '^',
              onPressed: () {
                calculator.kuadrat(
                    double.parse(num1Value), double.parse(num2Value));
              },
            ),
          ],
        ),
      ],
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
