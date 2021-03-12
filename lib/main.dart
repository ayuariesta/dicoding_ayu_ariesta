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
  var inputSuhu = new TextEditingController();
  var inputTB = new TextEditingController();
  var inputBB = new TextEditingController();

  _dropdownChange(String value) {
    setState(() {
      _jenis = value;
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
                      controller: inputSuhu,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    //untuk melakukan input tinggi badan
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Masukkan Tinggi badan'),
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
                      "BMI = ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 240, 20),
                    child: Text(
                      "BMR = ",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 140, 20),
                    child: Text(
                      "Berat badan ideal = ",
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
