import 'package:flutter/material.dart';
import 'beratBadan.dart';
import 'tinggiBadan.dart';
import 'convert.dart';
import 'formUsia.dart';

class BMRCalculator extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _BMRCalculatorState createState() => _BMRCalculatorState();
}

class _BMRCalculatorState extends State<BMRCalculator> {
  //controller
  var listJenis = ["Laki-laki", "Perempuan"];
  String _jenis = "Perempuan";
  var inputUsia = new TextEditingController();
  var inputTB = new TextEditingController();
  var inputBB = new TextEditingController();

  //state
  double _inputUsia = 0;
  double _inputTinggi = 0;
  double _inputBerat = 0;
  double _resultBMR = 0;

  _dropdownChange(String value) {
    setState(() {
      _jenis = value;
    });
  }

  //rumus menghitung BMR
  _rumusBMR() {
    setState(() {
      _inputTinggi = double.parse(inputTB.text);
      _inputBerat = double.parse(inputBB.text);
      _inputUsia = double.parse(inputUsia.text);
      if (_jenis == "Perempuan")
        _resultBMR = 66.5 +
            (13.7 * _inputBerat) +
            (5 * _inputTinggi) -
            (6.8 * _inputUsia);
      else
        _resultBMR = 655 +
            (9.6 * _inputBerat) +
            (1.8 * _inputTinggi) -
            (4.7 * _inputUsia);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'BMR Calculator',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.pinkAccent.shade400,
                              fontFamily: 'Pumpkin Pancakes'),
                        ),
                      ],
                    ),
                  ),
                  //dropdown untuk memilih jenis kelamin
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 40, 35, 15),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.pink.shade100,
                      items: listJenis.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      isExpanded: true,
                      value: _jenis,
                      onChanged: _dropdownChange,
                    ),
                  ),
                  //form untuk memasukkan usia
                  Formulir(inputUsia: inputUsia),
                  FormTB(inputTB: inputTB),
                  //form untuk memasukkan tinggi badan
                  FormBB(inputBB: inputBB),
                ],
              ),
              Column(
                children: [
                  Center(
                    //button untuk konversi
                    child: (Convert(title: "BMR", hitung: _rumusBMR)),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    //untuk menampilkan hasil dari perhitungan BMR
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "BMR = " + '$_resultBMR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
