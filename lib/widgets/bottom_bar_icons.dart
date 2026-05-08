import 'package:flutter/material.dart';

class NavBarIcon extends StatefulWidget {
  final String label;
  final IconData icon;
  final int i;
  final int currentIndex;
  final VoidCallback onTap;

  const NavBarIcon({
    super.key,
    required this.label,
    required this.icon,
    required this.i,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<NavBarIcon> createState() => _NavBarIconState();
}

class _NavBarIconState extends State<NavBarIcon> {
  @override
  Widget build(BuildContext context) {
    // Logic: Agar selected index aur is icon ka index barabar ho to highlight karo
    bool isSel = widget.currentIndex == widget.i;

    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            // 'widget.' use karna zaroori hai upar wali class ke variables k liye
            color: isSel ? Colors.white : Colors.white60,
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            widget.label,
            style: TextStyle(
              color: isSel ? Colors.white : Colors.white60,
              fontSize: 12,
              fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
