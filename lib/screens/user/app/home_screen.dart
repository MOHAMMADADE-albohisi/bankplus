import 'package:bankplus/Prefs/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../database/controllers/services_db_controller.dart';
import '../../../model_db/lone.dart';

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
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Image.asset('images/Vector.png'),
                ),
              ),
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
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications_screen');
                },
                icon: const Icon(Icons.notifications_active_outlined),
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
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 3),
                                blurRadius: 5,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              Image.asset('images/Transfer.png'),
                              const SizedBox(height: 20),
                              Text(
                                'القروض',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: const Color(0xFF696A6B),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: SizedBox(
                                  child: Text(
                                    'بأمكانك من خلال التطبيق سحب القرض بالقيمة التي تريدها بكل سهولة.',
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
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
                        padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                                height: 70,
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
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
                                              ' ${snapshot.data![index].amount}',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color:
                                                  const Color(0xFF000000)),
                                            ),
                                            const SizedBox(height: 2),
                                            Container(
                                              width: 290,
                                              child: Row(
                                                children: [
                                                  Text(snapshot
                                                      .data![index].state),
                                                  Spacer(),
                                                  Text(
                                                    snapshot.data![index].date,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 8,
                                                        fontWeight:
                                                        FontWeight.w500,
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
                                ));
                          },
                        ),
                      );
                    }
                    return Center(child: Text('لا يوجد طلبات قيد الانتضار'));
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
