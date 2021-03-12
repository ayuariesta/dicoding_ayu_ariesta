import 'package:flutter/material.dart';

class FormBB extends StatelessWidget {
  const FormBB({
    Key key,
    @required this.inputBB,
  }) : super(key: key);

  final TextEditingController inputBB;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Masukkan Berat badan'),
        controller: inputBB,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}
