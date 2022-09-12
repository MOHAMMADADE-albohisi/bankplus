import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class order_detailse_screen extends StatelessWidget {
  const order_detailse_screen({
    required this.titel,
    required this.money,
    Key? key,
  }) : super(key: key);
  final String titel;

  final String money;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SizedBox(
          width: 340,
          height: 60,
          child: Row(
            children: [
              Text(
                '$titel',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF060606),
                ),
              ),
              const Spacer(),
              Text(
                '$money',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xFFCA50CA),
                ),
              )
            ],
          ),
        ));
  }
}
