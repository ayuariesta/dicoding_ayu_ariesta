import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'beratBadan.dart';
import 'tinggiBadan.dart';
import 'convert.dart';
import 'formUsia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  double _resultBMI = 0;
  double _resultBMR = 0;
  double _resultIdeal = 0;

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

  //rumus menghitung BMI
  _rumusBMI() {
    setState(() {
      _inputTinggi = double.parse(inputTB.text);
      _inputBerat = double.parse(inputBB.text);
      _resultBMI = (_inputBerat * 10000) / (_inputTinggi * _inputTinggi);
    });
  }

  //rumus menghitung berat badan ideal
  _rumusIdeal() {
    setState(() {
      _inputTinggi = double.parse(inputTB.text);
      _inputBerat = double.parse(inputBB.text);
      if (_jenis == "Perempuan")
        _resultIdeal = (_inputTinggi - 100) - ((_inputTinggi - 100) * 0.15);
      else
        _resultIdeal = (_inputTinggi - 100) - ((_inputTinggi - 100) * 0.10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          //judul dari project
          title: Text("Kalkulator Sehat"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  //dropdown untuk memilih jenis kelamin
                  Container(
                    margin: EdgeInsets.all(5),
                    child: DropdownButton<String>(
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
                  Row(
                    //button untuk konversi
                    children: [
                      Convert(title: "BMI", hitung: _rumusBMI),
                      Convert(title: "BMR", hitung: _rumusBMR),
                      Convert(title: "Berat Ideal", hitung: _rumusIdeal),
                    ],
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
                  Container(
                    //untuk menampilkan hasil dari perhitungan BMR
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "BMR = " + '$_resultBMR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    //untuk menampilkan hasil dari perhitungan Berat badan ideal
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Berat badan ideal = " + '$_resultIdeal' + ' kg',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
