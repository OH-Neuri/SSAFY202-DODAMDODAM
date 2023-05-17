import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class NotifyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotifyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      actions: <Widget>[Container()],
      backgroundColor: bottomYellow,
      elevation: 0,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo.png', height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: badges.Badge(
                badgeContent: Text('N', style: TextStyle(color: Colors.white)),
                badgeAnimation: badges.BadgeAnimation.slide(animationDuration: Duration(seconds: 1)),
                child: InkWell(
                    onTap: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Icon(Icons.notifications, color: Colors.grey[800],)
                ),
              ),
            ),
          ]
      ),
    );
  }
}