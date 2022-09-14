import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessfulOperationScreen extends StatefulWidget {
  const SuccessfulOperationScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfulOperationScreen> createState() =>
      _SuccessfulOperationScreenState();
}

class _SuccessfulOperationScreenState extends State<SuccessfulOperationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 125),
          Image.asset('images/4.png'),
          const SizedBox(height: 34),
          Center(
            child: Text(
              'تم إرسال طلبك بنجاح',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color(0xFF000000)),
            ),
          ),
          const SizedBox(height: 200),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: double.infinity,
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(colors: [
                    Color(0xFFCA50CA),
                    Color(0xFFCA50CA),
                  ]),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/bottom_navigatio_screen');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text(
                    'الرئيسية',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFF5F5F5),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
