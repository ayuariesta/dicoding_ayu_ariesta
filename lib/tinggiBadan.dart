import 'package:flutter/material.dart';

class FormTB extends StatelessWidget {
  const FormTB({
    Key key,
    @required this.inputTB,
  }) : super(key: key);

  final TextEditingController inputTB;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(35, 15, 35, 15),
      //untuk melakukan input tinggi badan
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Masukkan Tinggi badan (cm)'),
        controller: inputTB,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}
