import 'package:bankplus/model_ui/bn_screen.dart';
import 'package:bankplus/screens/admin/app/home_admin_screen.dart';
import 'package:bankplus/screens/admin/app/list_admin_screen.dart';
import 'package:bankplus/screens/admin/app/mission_screen.dart';
import 'package:bankplus/screens/user/app/settings/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomAdminNavigationScreen extends StatefulWidget {
  const BottomAdminNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomAdminNavigationScreen> createState() =>
      _BottomAdminNavigationScreenState();
}

class _BottomAdminNavigationScreenState
    extends State<BottomAdminNavigationScreen> {
  int _selectedPageIndex = 0;

  final List<BnScreen> _screens = <BnScreen>[
    const BnScreen(title: '', widget: HomeAdminScreen()),
    const BnScreen(title: '', widget: MissionScreen()),
    const BnScreen(title: '', widget: ProfileScreen()),
    const BnScreen(title: '', widget: ListAdminScreen()),
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
                Icons.request_quote,
              ),
              icon: Icon(
                Icons.request_quote,
              ),
              label: 'الطلبات',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.rule),
              icon: Icon(Icons.rule),
              label: 'المهام',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.pivot_table_chart),
              icon: Icon(Icons.pivot_table_chart),
              label: 'احصائيات',
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
