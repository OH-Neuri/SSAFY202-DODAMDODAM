import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TitleAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: bottomYellow,
      elevation: 0,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(title, style: TextStyle(fontSize: contentTextSize, color: Colors.black, fontWeight: FontWeight.w700)),
            ),
            Image.asset('assets/images/logo.png', height: 40),
          ]
      ),
    );
  }
}