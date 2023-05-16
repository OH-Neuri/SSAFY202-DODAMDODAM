import 'package:app/components/common/text_form_field_custom.dart';
import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final Function(String) updateText;
  final bool enabled;
  final String hint;
  final bool isTeacher;
  final String content;

  const InputForm({
    required this.enabled,
    required this.hint,
    required this.isTeacher,
    required this.content,
    required this.updateText
  } );

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex:9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            child: Text("$hint", style: TextStyle(
              fontSize: 13
            ),),
          ),
          TextFormFieldCustom(updateText:updateText,  hint: '$content', onChanged: (val){ print(val);}, obscureText: false, enabled:enabled, isTeacher: isTeacher, )
        ],
      ),
    );
  }
}