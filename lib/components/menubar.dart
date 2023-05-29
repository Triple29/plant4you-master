import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Menubar extends StatefulWidget {
  const Menubar({Key? key}) : super(key: key);

  @override
  State<Menubar> createState() => _MenubarState();
}

class _MenubarState extends State<Menubar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color(0xFF375735),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 15),
          child: GNav(
            backgroundColor: const Color(0xFF375735),
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            gap: 8,
            onTabChange: (index) {
              print(index);
            }, // Add a comma here
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Like',
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
