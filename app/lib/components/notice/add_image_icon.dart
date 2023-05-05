import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddImageIcon extends StatelessWidget {
  final Function() onTap;
  const AddImageIcon({
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
        child: DottedBorder(
          color: Colors.grey,
          dashPattern: [4,3],
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add_a_photo_outlined, size: 20, color: Colors.grey,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Text('사진 첨부', style: TextStyle(color: Colors.grey),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}