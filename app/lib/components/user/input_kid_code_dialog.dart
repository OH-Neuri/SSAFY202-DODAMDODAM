import 'package:app/api/code_service.dart';
import 'package:app/components/common/custom_snackbar.dart';
import 'package:app/constants.dart';
import 'package:app/root.dart';
import 'package:flutter/material.dart';

class InputKidCodeDialog extends StatefulWidget {
  const InputKidCodeDialog({Key? key}) : super(key: key);

  @override
  State<InputKidCodeDialog> createState() => _InputClassCodeDialogState();
}

String code = '';

class _InputClassCodeDialogState extends State<InputKidCodeDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 220,
        padding: EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('학부모', style: TextStyle(fontWeight: FontWeight.w600),),
                Text('로 전송된')
              ],
            ),
            Text('코드를 입력해주세요.'),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: TextField(
                onChanged: (value){
                  setState(() {
                    code = value;
                  });
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'ex) 123456',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300
                  ),
                  filled: true,
                  fillColor: Color(0x50D5D5D5),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                ),cursorColor: Colors.grey,
              ),
            ),
            FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: darkYellow,
                  minimumSize: Size(double.infinity, 62),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                  )
                ),
                onPressed: () async {
                  final res = await CodeService.authKidCode(code);
                  if (!mounted) return;
                  if(res) {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Root()));
                  }else{
                    Navigator.of(context).pop();
                    CustomSnackBar.errorSnackbar(context, '올바른 코드가 아닙니다.');
                  }
                },
                child: Text('제출하기', style: TextStyle(fontSize: contentTextSize, fontWeight: FontWeight.w500),)
            )
          ],
        ),
      ),
    );
  }
}
