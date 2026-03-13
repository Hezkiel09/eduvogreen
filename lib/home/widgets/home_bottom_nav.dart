import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  final int currentIndex;

  const HomeBottomNav({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;
    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        break;
      case 1:
        Navigator.pushNamed(context, '/volunteer');
        break;
      case 2:
        Navigator.pushNamed(context, '/eduhub');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 8,
      currentIndex: currentIndex,
      onTap: (index) => _onTap(context, index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF148A43),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.volunteer_activism_outlined),
          label: 'Volunteer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          label: 'EduHub',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profil',
        ),
      ],
    );
  }
}
