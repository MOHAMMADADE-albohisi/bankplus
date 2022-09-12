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
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 343,
                          height: 70,
                          margin: EdgeInsetsDirectional.only(
                              bottom: index == 5 ? 0 : 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.5),
                                child: Icon(
                                  Icons.monetization_on,
                                  color: Color(0xFF28CA6A),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 320,
                                    child: Row(
                                      children: [
                                        Text(
                                          'طلب قرض',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              //
                                            },
                                            icon: const Icon(
                                              Icons.check_box_rounded,
                                              color: Color(0xFF5FCA8B),
                                            ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 320,
                                    child: Row(
                                      children: [
                                        Text(
                                          'طلب قرض من محمد بمليغ 3000\$',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'الاحد 22/10/2022',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 343,
                          height: 70,
                          margin: EdgeInsetsDirectional.only(
                              bottom: index == 5 ? 0 : 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.5),
                                child: Icon(
                                  Icons.monetization_on,
                                  color: Color(0xFF28CA6A),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 320,
                                    child: Row(
                                      children: [
                                        Text(
                                          'طلب قرض',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              //
                                            },
                                            icon: const Icon(
                                              Icons.check_box_rounded,
                                              color: Color(0xFF5FCA8B),
                                            ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 320,
                                    child: Row(
                                      children: [
                                        Text(
                                          'طلب قرض من محمد بمليغ 3000\$',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'الاحد 22/10/2022',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 343,
                          height: 70,
                          margin: EdgeInsetsDirectional.only(
                              bottom: index == 5 ? 0 : 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.5),
                                child: Icon(
                                  Icons.monetization_on,
                                  color: Colors.red,
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 320,
                                    child: Row(
                                      children: [
                                        Text(
                                          'طلب قرض',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              //
                                            },
                                            icon: const Icon(
                                              Icons.cancel,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 320,
                                    child: Row(
                                      children: [
                                        Text(
                                          'طلب قرض من محمد بمليغ 3000\$',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'الاحد 22/10/2022',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
