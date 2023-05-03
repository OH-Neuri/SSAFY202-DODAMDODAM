import 'package:flutter/material.dart';

class LogoutAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 3,
      title: Image.asset('assets/images/logo.png', height: 40,),
    );
  }

}