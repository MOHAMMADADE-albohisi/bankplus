import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class welcom_screen extends StatefulWidget {
  const welcom_screen({Key? key}) : super(key: key);

  @override
  State<welcom_screen> createState() => _welcom_screenState();
}

// ignore: camel_case_types
class _welcom_screenState extends State<welcom_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'بنك بلس',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 24.sp,
            color: const Color(0xFF000000),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: 0, sigmaX: 0),
            child: Image.asset(
              'images/Vector.png',
              width: double.infinity,
              fit: BoxFit.cover,
              height: 250,
            ),
          ),
          ListView(
            children: [
              const SizedBox(height: 350),
              Container(
                width: double.infinity,
                height: 400.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        'أهلا وسهلا بك في تطبيق بنك بلس',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'تسجيل دخول ....',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login_screen');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFb71174),
                              onPrimary: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              minimumSize: const Size(400, 50)),
                          child: const Text('عميل'),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/login_admin_screen');
                          },
                          style: ElevatedButton.styleFrom(
                              primary:  Colors.black,
                              onPrimary: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              minimumSize: const Size(400, 50)),
                          child: const Text('موظف'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
