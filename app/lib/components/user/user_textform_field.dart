import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class UserTextFormField extends StatelessWidget {
  final String hint;
  final FormFieldSetter onChanged;
  final bool obscureText;

  UserTextFormField({required this.hint, required this.onChanged, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.black26)),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: darkYellow)),
      ),
    );
  }
}
