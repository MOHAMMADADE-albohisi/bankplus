import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late PageController pagecontroller;
  int _colorPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pagecontroller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pagecontroller.dispose();
    super.dispose();
  }

  //***************************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: pagecontroller,
                onPageChanged: (int colorPage) {
                  setState(() => {
                        _colorPage = colorPage,
                      });
                },
                children: [
                  Column(
                    children: [
                      SizedBox(height: 112.h),
                      Image.asset('images/1.png', height: 317.h),
                      SizedBox(height: 18.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TabPageSelectorIndicator(
                            backgroundColor: _colorPage == 0
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: _colorPage == 0
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: _colorPage == 1
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: _colorPage == 1
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: _colorPage == 2
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: _colorPage == 2
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      Text(
                        '?????????? ?????? ?????? ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 98),
                        child: Text(
                          '???? ???????? ??????????  ?????? ?????? ???????????? ???????????? ?????? ???????? ???????????????? ?????????????? ?????? ??????????',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 112),
                      Image.asset('images/2.png', height: 317),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TabPageSelectorIndicator(
                            backgroundColor: _colorPage == 0
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: _colorPage == 0
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: _colorPage == 1
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: _colorPage == 1
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: _colorPage == 2
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: _colorPage == 2
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        '?????????? ?????? ?????? ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 98),
                        child: Text(
                          '???? ???????? ??????????  ?????? ?????? ???????????? ???????????? ?????? ???????? ???????????????? ?????????????? ?????? ??????????',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 112),
                      Image.asset('images/3.png', height: 317),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TabPageSelectorIndicator(
                            backgroundColor: _colorPage == 0
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: _colorPage == 0
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: _colorPage == 1
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: _colorPage == 1
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: _colorPage == 2
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: _colorPage == 2
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        '?????????? ?????? ?????? ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 98),
                        child: Text(
                          '???? ???????? ??????????  ?????? ?????? ???????????? ???????????? ?????? ???????? ???????????????? ?????????????? ?????? ??????????',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: AlignmentDirectional.center,
              child: Visibility(
                visible: _colorPage < 2,
                child: TextButton(
                  onPressed: () {
                    pagecontroller.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutBack);
                  },
                  child: Text(
                    '????????',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: const Color(0xFFCA50CA),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Visibility(
              visible: _colorPage == 2,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
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
                      Navigator.pushReplacementNamed(
                          context, '/complaints_admin_proposals_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Text(
                      '?????????? ????????????',
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
            const SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}
