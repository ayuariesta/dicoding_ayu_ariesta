import 'package:flutter/material.dart';

class Formulir extends StatelessWidget {
  const Formulir({
    Key key,
    @required this.inputUsia,
  }) : super(key: key);

  final TextEditingController inputUsia;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(35, 0, 35, 10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Masukkan Usia',
        ),
        controller: inputUsia,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}
