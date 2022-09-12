import 'package:bankplus/model_ui/bn_screen.dart';
import 'package:bankplus/screens/user/app/bpttom_screen.dart';
import 'package:bankplus/screens/user/app/home_screen.dart';
import 'package:bankplus/screens/user/app/settings/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'list_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPageIndex = 0;

  final List<BnScreen> _screens = <BnScreen>[
    const BnScreen(title: 'Home', widget: HomeScreen()),
    const BnScreen(title: 'Category ', widget: HomeBirdsScreen()),
    const BnScreen(title: 'Cart ', widget: ProfileScreen()),
    const BnScreen(title: ' ', widget: ListScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedPageIndex].widget,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          onTap: (int selectedPageIndex) {
            setState(() => _selectedPageIndex = selectedPageIndex);
          },
          currentIndex: _selectedPageIndex,
          backgroundColor: const Color(0xFFFFFFFF),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFCA50CA),
          selectedIconTheme: const IconThemeData(
            color: Color(0xFFCA50CA),
          ),
          selectedLabelStyle: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 12,
          ),
          unselectedItemColor: const Color(0xFF979797),
          unselectedIconTheme: const IconThemeData(
            color: Color(0xFF16162E),
          ),
          unselectedLabelStyle: GoogleFonts.nunito(
            color: const Color(0xFF16162E),
            fontSize: 12,
          ),
          iconSize: 24,
          elevation: 20,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
              ),
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home_repair_service),
              icon: Icon(Icons.home_repair_service_outlined),
              label: 'خدماتي',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outlined),
              label: 'حسابي',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.menu),
              icon: Icon(Icons.menu),
              label: 'القائمة',
            ),
          ],
        ),
      ),
    );
  }
}
