import 'package:flutter/material.dart';

class MedicineTextForm extends StatelessWidget {
  final Function(String) updateText;
  final String hint;

  MedicineTextForm({
    required this.hint,
    required this.updateText
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 26,
      margin: EdgeInsets.only(bottom: 0),
      child: TextFormField(
          onChanged: (onChanged){
            updateText(onChanged);
          },
          decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            hintText: hint,
            hintStyle: TextStyle(
            fontSize: 12,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.white),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
      ),
    );
  }
}
