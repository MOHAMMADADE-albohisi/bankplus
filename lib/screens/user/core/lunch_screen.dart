import 'package:flutter/material.dart';
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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/boarding_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/Vector.png'),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'مرحبا بك في تطبيق بنكي بلس ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
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