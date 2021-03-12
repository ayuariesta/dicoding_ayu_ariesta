import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({Key key, @required String title})
      : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 3, 7),
      //digunakan untuk melakukan perhitungan
      child: RaisedButton(
        onPressed: () {},
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
