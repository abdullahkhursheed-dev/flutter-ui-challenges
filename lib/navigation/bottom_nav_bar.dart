import 'package:big_font/Home/home_page.dart';
import 'package:big_font/social/social_page.dart';
import 'package:big_font/widgets/bottom_bar_icons.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _index = 0;
  final List<Widget> _screens = [
    //both pages are add there
    const HomePage(),
    SocialHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: Container(
        height: 65,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        decoration: BoxDecoration(
          color: Colors.blueAccent.shade200, // Custom Color
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavBarIcon(
              label: 'Font',
              icon: Icons.text_fields,
              i: 0,
              currentIndex: _index,
              onTap: () {
                setState(() => _index = 0);
              },
            ),
            NavBarIcon(
              label: 'Big Social',
              icon: Icons.public,
              i: 1,
              currentIndex: _index,
              onTap: () {
                setState(() => _index = 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
