import 'dart:ui';
import 'package:flutter/material.dart';
import 'beratBadan.dart';
import 'tinggiBadan.dart';
import 'convert.dart';

class BMICalculator extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  //controller
  var inputTB = new TextEditingController();
  var inputBB = new TextEditingController();

  //state

  double _inputTinggi = 0;
  double _inputBerat = 0;
  double _resultBMI = 0;

  //rumus menghitung BMI
  _rumusBMI() {
    setState(() {
      _inputTinggi = double.parse(inputTB.text);
      _inputBerat = double.parse(inputBB.text);
      _resultBMI = (_inputBerat * 10000) / (_inputTinggi * _inputTinggi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: <Widget>[
                  Text(
                    'BMI Calculator',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent.shade400,
                        fontFamily: 'Pumpkin Pancakes'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  //form untuk memasukkan usia
                  FormTB(inputTB: inputTB),
                  //form untuk memasukkan tinggi badan
                  FormBB(inputBB: inputBB),
                ],
              ),
            ),
            Column(
              children: [
                Center(
                  //button untuk konversi
                  child: (Convert(title: "BMI", hitung: _rumusBMI)),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  //untuk menampilkan hasil dari perhitungan BMI
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "BMI = " + '$_resultBMI',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
