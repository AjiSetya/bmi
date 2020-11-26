import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int weight = 3;
  int height = 49;
  double bmi = 0;

  String calculate() {
    setState(() {
      bmi = weight / pow(height / 100, 2);
      return bmi.toStringAsFixed(1);
    });
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getDescription() {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              onChanged: (value) {
                height = int.parse(value);
              },
              decoration: InputDecoration(hintText: "Height"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                weight = int.parse(value);
              },
              decoration: InputDecoration(hintText: "Weight"),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: calculate,
              child: Text("CALCULATE"),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(getResult()),
                  SizedBox(
                    height: 20,
                  ),
                  Text(getDescription()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
