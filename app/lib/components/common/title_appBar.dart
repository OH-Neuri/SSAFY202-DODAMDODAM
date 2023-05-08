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
      backgroundColor: Colors.amberAccent,
      elevation: 3,
      title: Row(
          children: [
            Image.asset('assets/images/logo.png', height: 40),
            Text(title),
          ]
      ),
    );
  }
}