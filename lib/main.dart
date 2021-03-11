import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          title: Text("Kalkulator Sehat"),
        ),
        body: DropdownButton(
          items: [
            DropdownMenuItem(
                value: "Kelvin", child: Container(child: Text("Kelvin"))),
            DropdownMenuItem(
                value: "Reamur", child: Container(child: Text("Reamur"))),
          ],
          value: null,
          onChanged: (String changeValue) {},
        ),
      ),
    );
  }
}
