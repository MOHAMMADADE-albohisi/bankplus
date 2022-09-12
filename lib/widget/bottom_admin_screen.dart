// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class home_admin_widget extends StatelessWidget {
  const home_admin_widget({
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
      child: InkWell(
        onTap: (){
         //
        },
        child:  ListView.builder(
            shrinkWrap: true,
            itemCount: 50,
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
                            vertical: 9,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(titel,style: GoogleFonts.poppins(),),
                                  const SizedBox(width: 150),
                                  Text(
                                    datename,
                                    style: GoogleFonts.poppins(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    date,
                                    style: GoogleFonts.poppins(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                              Text(
                                  value,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
