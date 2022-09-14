import 'package:bankplus/database/controllers/services_db_controller.dart';
import 'package:bankplus/model_db/lone.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class MissionScreen extends StatefulWidget {
  const MissionScreen({Key? key}) : super(key: key);

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

// ignore: camel_case_types
class _MissionScreenState extends State<MissionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset('images/mohammad.jpeg'),
                  ),
                  title: Text(
                    "مرحبا محمد ",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    "اهلا بك",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: Image.asset('images/Vector.png'),
                ),
              )
            ],
          ),
          const Divider(),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                indicator: const BoxDecoration(
                  color: Color(0xFFCA50CA),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                controller: _tabController,
                labelColor: const Color(0xFF000000),
                tabs: const [
                  Tab(text: 'الكل'),
                  Tab(text: 'مهام مكتملة'),
                  Tab(text: 'مهام ملغاه'),
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
                    return const Center(child: Text('لا يوجد اي من المهامات'));
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
                    return const Center(child: Text('لا يوجد مهام مكتملة'));
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
                    return const Center(child: Text('لا يوجد مهام ملغاه'));
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
