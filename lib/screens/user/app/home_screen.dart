import 'dart:io';

import 'package:bankplus/Prefs/shared_preferences.dart';
import 'package:bankplus/database/controllers/user_db_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../database/controllers/services_db_controller.dart';
import '../../../model_db/lone.dart';
import '../../../model_db/regester_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7, initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
             FutureBuilder<User?>(
               future: UserDbController().show(),
               builder: (context, snapshot) {
                 if(snapshot.hasData){
                   return Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 11),
                     child: Container(
                       clipBehavior: Clip.antiAlias,
                       width: 40,
                       height: 40,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.grey,
                       ),
                       child: Image.file(File(snapshot.data!.userImage),fit: BoxFit.cover,),
                     ),
                   );
                 }
               return Center(child: Text('No Data'),);
             },),
              const SizedBox(width: 16),
              Column(
                children: [
                  Text(
                    ' مرحبا ${SharedPrefController().getValueFor(savedata.userName.name)}',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'اهلا بعودتك',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications_screen');
                },
                child: Image.asset('images/Frame 4.png'),
              ),
            ],
          ),
          const Divider(thickness: 1),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 150),
            child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int pageIndex) {},
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        EdgeInsetsDirectional.only(end: index != 2 ? 10 : 0),
                    child: Image.asset(
                      'images/Card Empty.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  );
                }),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'اطلب خدمتك',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/loan_request_screen');
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 95,
                        height: 100,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(2, 3),
                              blurRadius: 5,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset('images/Transfer.png'),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'القروض',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: const Color(0xFF696A6B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      'العمليات الاخيرة',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                FutureBuilder<List<Services>>(
                  future: ServicesDbController().read(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 80,
                              margin: EdgeInsetsDirectional.only(
                                  bottom: index == 5 ? 0 : 15),
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
                              child: Row(
                                children: [
                                  Image.asset('images/coin.png'),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ' ${snapshot.data![index].amount}\$',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: const Color(0xFF000000)),
                                        ),
                                        const SizedBox(height: 2),
                                        SizedBox(
                                          width: 295,
                                          child: Row(
                                            children: [
                                              Text(snapshot.data![index].state),
                                              const Spacer(),
                                              Text(
                                                snapshot.data![index].date,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Center(
                        child: Column(
                      children: [
                        Image.asset('images/paper.png'),
                        const SizedBox(height: 12),
                        Text(
                          'لا يوجد عمليات',
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFB9B9B9),
                          ),
                        )
                      ],
                    ));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
