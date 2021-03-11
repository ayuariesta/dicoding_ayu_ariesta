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
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan Usia',
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: inputSuhu,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ],
            ),
            //form untuk memasukkan tinggi badan
            Container(
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Masukkan Tinggi badan'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: inputTB,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            )
          ],
        ),
      ),
    );
  }
}
