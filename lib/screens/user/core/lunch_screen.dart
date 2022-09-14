import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),() {
        Navigator.pushReplacementNamed( context, '/complaints_admin_proposals_screen');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 123.h),
            Image.asset(
              'images/Vector.png',
              width: 90.w,
              height: 64.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 28.h),
            Center(
              child: Text(
                'مرحبا بك في تطبيق بنك بلس ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w100,
                  fontSize: 22.sp,
                  color: const Color(0xFF000000),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
