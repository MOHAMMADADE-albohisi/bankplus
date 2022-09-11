import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class home_bottome_widget extends StatelessWidget {
  const home_bottome_widget({
    Key? key,
    required this.image,
    required this.titel,
    required this.date,
    required this.datename,
    required this.value,
  }) : super(key: key);
  final String image;
  final String titel;
  final String date;
  final String datename;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
                height: 70,
                margin: EdgeInsetsDirectional.only(bottom: index == 5 ? 0 : 15),
                decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.black38,
                        blurRadius: 4,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset('images/$image.png'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '3.000\$',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: const Color(0xFF000000)),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                 Text('$titel'),
                                const SizedBox(width: 30),
                                Text(
                                  '$datename',
                                  style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                Text(
                                  '$date',
                                  style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}
