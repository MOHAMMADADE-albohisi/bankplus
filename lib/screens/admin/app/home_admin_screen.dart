// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, unnecessary_null_comparison

import 'package:bankplus/database/controllers/admin_db_controller.dart';
import 'package:bankplus/database/controllers/services_db_controller.dart';
import 'package:bankplus/model_db/lone.dart';
import 'package:bankplus/model_ui/country.dart';
import 'package:bankplus/screens/admin/app/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

// ignore: camel_case_types
class _HomeAdminScreenState extends State<HomeAdminScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedcountryid = 4;

  final List<Country> _Countryss = <Country>[
    Country(id: 1, title: 'فرع الجنوب'),
    Country(id: 2, title: 'فرع الوسطى'),
    Country(id: 3, title: 'فرع الشمال'),
    Country(id: 4, title: 'الفرع الرئيسي'),
    Country(id: 5, title: 'فرع الرمال'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        crossAxisAlignment: CrossAxisAlignment.end,
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
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: DropdownButton<int>(
                        isExpanded: true,
                        hint: const Text(
                          'اختر الفرع',
                        ),
                        style: GoogleFonts.montserrat(
                          color: Colors.black54,
                        ),
                        onChanged: (int? value) {
                          setState(() => _selectedcountryid = value!);
                        },
                        //***************************************************
                        borderRadius: BorderRadius.circular(20),
                        dropdownColor: Colors.grey,
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        //للتحكم بحجم القائمة
                        itemHeight: 48,
                        underline: const Divider(),
                        value: _selectedcountryid,
                        //***************************************************
                        selectedItemBuilder: (BuildContext cotext) {
                          return _selectedcountryid != null
                              ? _Countryss.map(
                                  (e) => Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      _Countryss.firstWhere((element) =>
                                              element.id == _selectedcountryid)
                                          .title,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.grey),
                                    ),
                                  ),
                                ).toList()
                              : [];
                        },
                        //***************************************************
                        items: _Countryss.map(
                          (Countrysss) {
                            return DropdownMenuItem<int>(
                              value: Countrysss.id,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Countrysss.title),
                                  const Divider(
                                    thickness: 0.8,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
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
                  Tab(text: 'طلبات جديدة'),
                  Tab(text: 'طلبات قديمة'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FutureBuilder<List<Services>>(
                  future: AdminDbController().read(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                await ServicesDbController().update(
                                    snapshot.data![index].id,
                                    'الطلب في حالة قيد المراجعة');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderDetailsScreen(
                                        snapshot.data![index].id),
                                  ),
                                );
                              },
                              child: Container(
                                  height: 100,
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
                                        horizontal: 15),
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
                                                'طلب قرض',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: const Color(
                                                        0xFF000000)),
                                              ),
                                              const SizedBox(height: 2),
                                              SizedBox(
                                                width: 290,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 235,
                                                      height: 50,
                                                      child: Text(
                                                          'طلب قرض من ${snapshot.data![index].user_name} بمبلغ ${snapshot.data![index].amount}\$'),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      snapshot
                                                          .data![index].date,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ),
                      );
                    }
                    return const Center(child: Text('لا يوجد طلبات جديدة'));
                  },
                ),
                FutureBuilder<List<Services>>(
                  future: AdminDbController().read(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () async {
                                await ServicesDbController().update(
                                    snapshot.data![index].id,
                                    'الطلب في حالة قيد المراجعة');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderDetailsScreen(
                                        snapshot.data![index].id),
                                  ),
                                );
                              },
                              child: Container(
                                  height: 100,
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
                                        horizontal: 15),
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
                                                'طلب قرض',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: const Color(
                                                        0xFF000000)),
                                              ),
                                              const SizedBox(height: 2),
                                              SizedBox(
                                                width: 290,
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 235,
                                                      height: 50,
                                                      child: Text(
                                                          'طلب قرض من ${snapshot.data![index].user_name} بمبلغ ${snapshot.data![index].amount}\$'),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      snapshot
                                                          .data![index].date,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ),
                      );
                    }
                    return const Center(child: Text('لا يوجد طلبات جديدة'));
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
