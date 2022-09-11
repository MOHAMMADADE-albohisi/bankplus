import 'package:bankplus/screens/user/app/bpttom_screen.dart';
import 'package:bankplus/screens/user/app/loan_screen/loan_request_screen.dart';
import 'package:bankplus/screens/user/app/loan_screen/successful_operation_screen.dart';
import 'package:bankplus/screens/user/auth/regester_screen.dart';
import 'package:bankplus/screens/user/auth/restore_password_screen.dart';
import 'package:bankplus/screens/user/auth/verify_the_number_screen.dart';
import 'package:bankplus/screens/user/app/home_screen.dart';
import 'package:bankplus/screens/user/auth/login_screen.dart';
import 'package:bankplus/screens/user/core/lunch_screen.dart';
import 'package:bankplus/screens/user/core/on_bording_screen.dart';
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
      initialRoute: '/_home_birds_screenState',
      routes: {
        '/lunch_screen': (context) => const LunchScreen(),
        '/boarding_screen': (context) => const OnBordingScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/verify_the_number_screen': (context) => const VerifyTheNumberScreen(),
        '/regester_screen': (context) => const RegesterScreen(),
        '/restore_password_screen': (context) => const RestorePasswordScreen(),

        '/home_screen': (context) => const HomeScreen(),
        '/loan_request_screen': (context) => const LoanRequestScreen(),
        '/successful_operation_screen': (context) => const SuccessfulOperationScreen(),
        '/_home_birds_screenState': (context) => const HomeBirdsScreen( ),
      },
    );
  }
}
