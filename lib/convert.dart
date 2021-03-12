import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
