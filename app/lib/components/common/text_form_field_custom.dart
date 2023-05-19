import 'package:flutter/material.dart';
import 'package:app/constants.dart';


class TextFormFieldCustom extends StatelessWidget {
  final String hint;
  final FormFieldSetter onChanged;
  final bool obscureText;
  final bool enabled;
  final bool isTeacher;

  TextFormFieldCustom({
    required this.hint,
    required this.onChanged,
    required this.obscureText,
    this.enabled = true,
    this.isTeacher = true,
  });

  @override
  Widget build(BuildContext context) {
    Color fillColor;
    if (isTeacher) {
      fillColor = enabled ? cardYellow : Colors.white;
    } else {
      fillColor = enabled ? cardPink : Colors.white;
    }

    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      obscureText: obscureText,
      enabled: enabled,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        hintText: hint,
        hintStyle: TextStyle(
          color: enabled ? Colors.black87: Colors.black87,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.black26),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.black26),
        ),
        filled: true,
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: darkYellow),
        ),
      ),
    );
  }
}