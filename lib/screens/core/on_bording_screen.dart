import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({Key? key}) : super(key: key);

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late PageController pagecontroller;
  int backcolor = 0;
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
                onPageChanged: (int backcolor) {
                  setState(() => {
                        backcolor = backcolor,
                      });
                },
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 112),
                      Image.asset('images/1.png', height: 317),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TabPageSelectorIndicator(
                            backgroundColor: backcolor == 0
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: backcolor == 0
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: backcolor == 1
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: backcolor == 1
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: backcolor == 2
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: backcolor == 2
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'تطبيق بنكي بلس ',
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
                          'من خلال تطبيق  بنك بلس تستطيع الحصول على كافة معاملاتك البنكية بكل سهولة',
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
                            backgroundColor: backcolor == 0
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: backcolor == 0
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: backcolor == 1
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: backcolor == 1
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: backcolor == 2
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: backcolor == 2
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'تطبيق بنكي بلس ',
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
                          'من خلال تطبيق  بنك بلس تستطيع الحصول على كافة معاملاتك البنكية بكل سهولة',
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
                            backgroundColor: backcolor == 0
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: backcolor == 0
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: backcolor == 1
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: backcolor == 1
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                          TabPageSelectorIndicator(
                            backgroundColor: backcolor == 2
                                ? const Color(0xFFCA50CA)
                                : Colors.grey,
                            borderColor: backcolor == 2
                                ? const Color(0xFFCA50CA)
                                : const Color(0xFFE6E8E6),
                            size: 10,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        'تطبيق بنكي بلس ',
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
                          'من خلال تطبيق  بنك بلس تستطيع الحصول على كافة معاملاتك البنكية بكل سهولة',
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
                visible: backcolor < 2,
                child: TextButton(
                  onPressed: () {
                    pagecontroller.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutBack);
                  },
                  child: Text(
                    'تخطي',
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
              visible: backcolor == 2,
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
                      Navigator.pushReplacementNamed(context, '/login_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Text(
                      'تسجيل الدخول',
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
