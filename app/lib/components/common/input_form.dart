import 'package:app/components/common/text_form_field_custom.dart';
import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final bool enabled;
  final String hint;
  const InputForm({
    required this.enabled,
    required this.hint
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex:12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Text("$hint",style: TextStyle(
            ),),
          ),
          TextFormFieldCustom(hint: '$hint 입력', onChanged: (val){}, obscureText: false, enabled:enabled, )
        ],
      ),
    );
  }
}