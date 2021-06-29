import 'package:flutter/material.dart';
import 'beratBadan.dart';
import 'tinggiBadan.dart';
import 'convert.dart';

class Ideal extends StatefulWidget {
  @override
  _IdealState createState() => _IdealState();
}

class _IdealState extends State<Ideal> {
  //controller
  var listJenis = ["Laki-laki", "Perempuan"];
  String _jenis = "Perempuan";
  var inputTB = new TextEditingController();
  var inputBB = new TextEditingController();

  //state
  double _inputTinggi = 0;
  double _inputBerat = 0;
  double _resultIdeal = 0;

  _dropdownChange(String value) {
    setState(() {
      _jenis = value;
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
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Container(
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
                        'Ideal Calculator',
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
                  margin: EdgeInsets.fromLTRB(35, 40, 35, 0),
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
                FormTB(inputTB: inputTB),
                //form untuk memasukkan tinggi badan
                FormBB(inputBB: inputBB),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    //button untuk konversi
                    child: (Convert(title: "Berat Ideal", hitung: _rumusIdeal)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
