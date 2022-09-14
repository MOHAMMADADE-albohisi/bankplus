import 'package:bankplus/Prefs/shared_preferences.dart';
import 'package:bankplus/database/db_controller.dart';
import 'package:bankplus/screens/admin/app/bottom_navigation_admin_screen.dart';
import 'package:bankplus/screens/admin/app/home_admin_screen.dart';
import 'package:bankplus/screens/admin/app/list_admin_screen.dart';
import 'package:bankplus/screens/admin/app/mission_screen.dart';
import 'package:bankplus/screens/admin/auth_admin/login_admin_screen.dart';
import 'package:bankplus/screens/user/app/bottom_navigation_screen.dart';
import 'package:bankplus/screens/user/app/bpttom_screen.dart';
import 'package:bankplus/screens/user/app/complaints_proposals_screen.dart';
import 'package:bankplus/screens/user/app/list_screen.dart';
import 'package:bankplus/screens/user/app/loan_screen/loan_request_screen.dart';
import 'package:bankplus/screens/user/app/loan_screen/successful_operation_screen.dart';
import 'package:bankplus/screens/user/app/settings/notifications_screen.dart';
import 'package:bankplus/screens/user/app/settings/profile_screen.dart';
import 'package:bankplus/screens/user/auth/regester_screen.dart';
import 'package:bankplus/screens/user/auth/restore_password_screen.dart';
import 'package:bankplus/screens/user/auth/verify_the_number_screen.dart';
import 'package:bankplus/screens/user/app/home_screen.dart';
import 'package:bankplus/screens/user/auth/login_screen.dart';
import 'package:bankplus/screens/user/core/lunch_screen.dart';
import 'package:bankplus/screens/user/core/on_bording_screen.dart';
import 'package:bankplus/screens/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferTest();
  await DbController().initDatabase();
  runApp(const BankPlus());
}

class BankPlus extends StatelessWidget {
  const BankPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                centerTitle: true,
                elevation: 0,
                color: const Color(0xFFFFFFFF),
                titleTextStyle: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            locale: const Locale('ar'),
            initialRoute: '/lunch_screen',
            routes: {
              '/lunch_screen': (context) => const LunchScreen(),
              '/boarding_screen': (context) => const OnBordingScreen(),
              '/complaints_admin_proposals_screen': (context) =>
                  const welcom_screen(),
              '/login_screen': (context) => const LoginScreen(),
              '/verify_the_number_screen': (context) =>
                  const VerifyTheNumberScreen(),
              '/regester_screen': (context) => const RegesterScreen(),
              '/restore_password_screen': (context) =>
                  const RestorePasswordScreen(),
              '/home_screen': (context) => const HomeScreen(),
              '/loan_request_screen': (context) => const LoanRequestScreen(),
              '/successful_operation_screen': (context) =>
                  const SuccessfulOperationScreen(),
              '/_home_birds_screenState': (context) => const HomeBirdsScreen(),
              '/profile_screen': (context) => const ProfileScreen(),
              '/list_screen': (context) => const ListScreen(),
              '/bottom_navigatio_screen': (context) =>
                  const BottomNavigationScreen(),
              '/complaints_proposals_screen': (context) =>
                  const ComplaintsProposalsScreen(),
              '/notifications_screen': (context) => const NotificationsScreen(),
              '/login_admin_screen': (context) => const LoginAdminScreen(),
              '/home_admin_screen': (context) => const HomeAdminScreen(),
              '/mission_screen': (context) => const MissionScreen(),
              '/list_admin_screen': (context) => const ListAdminScreen(),
              '/bottom_admin_navigation_screen': (context) =>
                  const BottomAdminNavigationScreen(),
            },
          );
        });
  }
}
