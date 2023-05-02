import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hint;
  final FormFieldSetter onChanged;
  final bool obscureText;
  final bool enabled;
  TextFormFieldCustom({required this.hint, required this.onChanged, required this.obscureText,this.enabled = true,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      // onChanged: (){},
      obscureText: obscureText,
      enabled: enabled,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical:0,horizontal: 15),
        hintText: hint,
        hintStyle: TextStyle(
            color: enabled ? Colors.grey:Colors.black87,
            fontSize: 14
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black26)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black26),
        ),
        filled: true,
        fillColor:enabled ? Colors.white:cardYellow,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: darkYellow)),
      ),
    );
  }
}