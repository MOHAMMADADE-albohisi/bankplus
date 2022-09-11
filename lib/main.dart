import 'package:bankplus/screens/auth/login_screen.dart';
import 'package:bankplus/screens/auth/regester_screen.dart';
import 'package:bankplus/screens/auth/verify_the_number_screen.dart';
import 'package:bankplus/screens/core/lunch_screen.dart';
import 'package:bankplus/screens/core/on_bording_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BankPlus());
}

class BankPlus extends StatelessWidget {
  const BankPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/login_screen',
      routes: {
        '/lunch_screen': (context) => const LunchScreen(),
        '/boarding_screen': (context) => const OnBordingScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/verify_the_number_screen': (context) => const VerifyTheNumberScreen(),
        '/regester_screen': (context) => const RegesterScreen(),
      },
    );
  }
}
