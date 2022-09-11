import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hint,
    required this.prefixIcon,
    required this.keyboardType,
    required this.controller,
    this.color = Colors.black,
    this.focuseBorderdColor = Colors.blue,
    this.sufficIcon,
    this.obscureText = false,

  }) : super(key: key);

  final String hint;
  final IconData prefixIcon;

  final TextInputType keyboardType;
  final TextEditingController controller;
  final Color focuseBorderdColor;
  final Widget? sufficIcon;
  final bool obscureText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: GoogleFonts.cairo(),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.nunitoSans(fontSize: 14.sp,
            color: Color(0xFFD2D7E9),
            fontWeight: FontWeight.w400),
        hintMaxLines: 1,
        suffixIcon: sufficIcon,
        suffixIconColor: color,
        prefixIcon: Icon(prefixIcon, color: Colors.blueGrey,),
        enabledBorder: buildOutlineInputBorder(),
        contentPadding: EdgeInsets.zero,
        focusedBorder: buildOutlineInputBorder(color: focuseBorderdColor),

      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
          color: color
      ),
    );
  }
}