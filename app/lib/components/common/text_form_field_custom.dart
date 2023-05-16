import 'package:flutter/material.dart';
import 'package:app/constants.dart';


class TextFormFieldCustom extends StatelessWidget {
  final Function(String) updateText;
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
    required this.updateText,
  });

  @override
  Widget build(BuildContext context) {
    Color fillColor;
    if (isTeacher) {
      fillColor = enabled ? cardYellow : Colors.white10;
    } else {
      fillColor = enabled ? cardPink : Colors.white10;
    }

    return Container(
     height: 37,
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onChanged: (onChanged){
          updateText(onChanged);
          },
        obscureText: obscureText,
        enabled: enabled,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
          hintText: hint,
          hintStyle: TextStyle(
            color: enabled ? Colors.black87: Colors.black87,
            fontSize: 13,
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
      ),
    );
  }
}