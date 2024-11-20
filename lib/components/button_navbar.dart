import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class ButtonNavBar extends StatefulWidget {
  final int selectedItem;
  final Function(int) onTap;
  const ButtonNavBar({super.key, required this.onTap, required this.selectedItem});

  @override
  State<ButtonNavBar> createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w*.015, vertical: h*.01),
        child: GNav(
          gap: 10,
          tabBorderRadius: 100,
          backgroundColor: Colors.grey[100]!,
          activeColor: Colors.white,
          color: Colors.green[600],
          tabBackgroundGradient: LinearGradient(
            colors: [
              Colors.lightGreen[400]!,
              Colors.greenAccent.shade400
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            ),
            iconSize: 30,
            textSize: 18,
            padding: EdgeInsets.symmetric(horizontal: w*.01, vertical: h*.01),
            tabs: const [
              GButton(icon: CupertinoIcons.home, text: 'Home',),
              GButton(icon: Icons.category, text: 'Categories',),
              GButton(icon: CupertinoIcons.search, text: 'Search',),
              GButton(icon: CupertinoIcons.bookmark_solid, text: 'Saved',),
              GButton(icon: CupertinoIcons.shopping_cart, text: 'Shopping',),
            ],
          
          onTabChange: widget.onTap,
          selectedIndex: 0,
          ),
        
        ),
    );
  }
}