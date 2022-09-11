import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBordaingContent extends StatelessWidget {
  const OnBordaingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            children: [
              Image.asset(
                'images/$image',
                height: 317,
              ),

              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 20.8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFF716F87),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
