import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyTheNumberScreen extends StatefulWidget {
  const VerifyTheNumberScreen({Key? key}) : super(key: key);

  @override
  State<VerifyTheNumberScreen> createState() => _VerifyTheNumberScreenState();
}

class _VerifyTheNumberScreenState extends State<VerifyTheNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'التحقق من الرقم',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
