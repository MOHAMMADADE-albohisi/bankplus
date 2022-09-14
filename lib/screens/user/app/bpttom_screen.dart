import 'package:bankplus/database/controllers/services_db_controller.dart';
import 'package:bankplus/model_db/lone.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class HomeBirdsScreen extends StatefulWidget {
  const HomeBirdsScreen({Key? key}) : super(key: key);

  @override
  State<HomeBirdsScreen> createState() => _HomeBirdsScreenState();
}

// ignore: camel_case_types
class _HomeBirdsScreenState extends State<HomeBirdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'خدماتي ',
          style: GoogleFonts.poppins(
              fontSize: 15,
              color: const Color(0xFF060606),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/notifications_screen');
            },
            icon: const Icon(Icons.notifications_active_outlined),
            color: const Color(0xFF060606),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                indicator: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  boxShadow: [
                    BoxShadow(offset: Offset(0, 0), color: Color(0xFF000000))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                controller: _tabController,
                labelColor: const Color(0xFF000000),
                tabs: const [
                  Tab(text: 'الانتظار'),
                  Tab(text: ' المراجعة'),
                  Tab(text: 'مقبول'),
                  Tab(text: 'مرفوض'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FutureBuilder<List<Services>>(
                  future: ServicesDbController().read(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      snapshot.data!.removeWhere((element) =>
                          element.state !=
                          'الطلب في حالة انتظار الموافقة عليه');
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
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
                                              ' ${snapshot.data![index].amount}\$',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color:
                                                      const Color(0xFF000000)),
                                            ),
                                            const SizedBox(height: 2),
                                            SizedBox(
                                              width: 290,
                                              child: Row(
                                                children: [
                                                  Text(snapshot
                                                      .data![index].state),
                                                  const Spacer(),
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
                    return const Center(
                        child: Text('لا يوجد طلبات قيد الانتضار'));
                  },
                ),
                FutureBuilder<List<Services>>(
                  future: ServicesDbController().read(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      snapshot.data!.removeWhere((element) =>
                          element.state != 'الطلب في حالة قيد المراجعة');
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
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
                                      Image.asset('images/coin2.png'),
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
                                                  color:
                                                      const Color(0xFF000000)),
                                            ),
                                            const SizedBox(height: 2),
                                            SizedBox(
                                              width: 290,
                                              child: Row(
                                                children: [
                                                  Text(snapshot
                                                      .data![index].state),
                                                  const Spacer(),
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
                    return const Center(
                        child: Text('لا يوجد طلبات قيد المراجعة'));
                  },
                ),
                FutureBuilder<List<Services>>(
                  future: ServicesDbController().read(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      snapshot.data!.removeWhere(
                          (element) => element.state != 'الطلب مقبول');
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
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
                                      Image.asset('images/coin3.png'),
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
                                                  color:
                                                      const Color(0xFF000000)),
                                            ),
                                            const SizedBox(height: 2),
                                            SizedBox(
                                              width: 290,
                                              child: Row(
                                                children: [
                                                  Text(snapshot
                                                      .data![index].state),
                                                  const Spacer(),
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
                    return const Center(child: Text('لا يوجد طلبات'));
                  },
                ),
                FutureBuilder<List<Services>>(
                  future: ServicesDbController().read(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      snapshot.data!.removeWhere(
                          (element) => element.state != 'الطلب مرفوض');
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
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
                                      Image.asset('images/coin4.png'),
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
                                                  color:
                                                      const Color(0xFF000000)),
                                            ),
                                            const SizedBox(height: 2),
                                            SizedBox(
                                              width: 290,
                                              child: Row(
                                                children: [
                                                  Text(snapshot
                                                      .data![index].state),
                                                  const Spacer(),
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
                    return const Center(child: Text('لا يوجد طلبات'));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
