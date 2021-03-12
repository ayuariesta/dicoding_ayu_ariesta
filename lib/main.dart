import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var listJenis = ["Laki-laki", "Perempuan"];
  String _jenis = "Perempuan";
  var inputUsia = new TextEditingController();
  var inputTB = new TextEditingController();
  var inputBB = new TextEditingController();

  //state
  double _inputUsia = 0;
  double _inputTinggi = 0;
  double _inputBerat = 0;
  double _usia = 0;
  double _tinggi = 0;
  double _berat = 0;
  double _resultBMI = 0;
  double _resultBMR = 0;
  double _resultIdeal = 0;

  _dropdownChange(String value) {
    setState(() {
      _jenis = value;
    });
  }

  // ignore: unused_element
  _rumusBMI() {
    setState(() {
      _inputTinggi = double.parse(inputTB.text);
      _inputBerat = double.parse(inputBB.text);
      _resultBMI = (_inputBerat * 10000) / (_inputBerat * _inputBerat);
    });
  }

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
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan Usia',
                      ),
                      controller: inputUsia,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    //untuk melakukan input tinggi badan
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Masukkan Tinggi badan (cm)'),
                      controller: inputTB,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  //form untuk memasukkan tinggi badan
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Masukkan Berat badan'),
                      controller: inputBB,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(80, 20, 80, 30),
                    height: 40,
                    width: 180,
                    //digunakan untuk melakukan perhitungan
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'Hitung',
                        style: TextStyle(fontSize: 17),
                      ),
                      textColor: Colors.white,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    //untuk menampilkan hasil dari perhitungan
                    margin: EdgeInsets.fromLTRB(0, 0, 250, 20),
                    child: Text(
                      "BMI = " + '$_resultBMI',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 240, 20),
                    child: Text(
                      "BMR = " + '$_resultBMR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 140, 20),
                    child: Text(
                      "Berat badan ideal = " + '$_resultIdeal',
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
