import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({Key key, @required String title, @required Function hitung})
      : _title = title,
        _hitung = hitung,
        super(key: key);

  final String _title;
  final Function _hitung;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 3, 7),
      //digunakan untuk melakukan perhitungan
      child: RaisedButton(
        onPressed: _hitung,
        child: Text(
          _title,
          style: TextStyle(fontSize: 17),
        ),
        textColor: Colors.white,
        color: Colors.pink,
      ),
    );
  }
}
