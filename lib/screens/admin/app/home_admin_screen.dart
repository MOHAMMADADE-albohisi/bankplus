import 'package:bankplus/model_ui/country.dart';
import 'package:bankplus/widget/bottom_admin_screen.dart';
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
  int? _selectedcountryid;

  final List<Country> _Countryss = <Country>[
    Country(id: 1, title: 'فرع الجنوب'),
    Country(id: 2, title: 'فرع الوسطى'),
    Country(id: 3, title: 'فرع الشمال'),
    Country(id: 4, title: 'فرع الوسطى'),
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
          SizedBox(height: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: DropdownButton<int>(
                    isExpanded: true,
                    hint: const Text(
                      'اختر الفرع',
                    ),
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                    ),
                    onChanged: (int? value) {
                      setState(() => _selectedcountryid = value);
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
                                      element.id == _selectedcountryid).title,
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
                const home_admin_widget(
                  image: 'coin',
                  titel: 'طلب قرض',
                  datename: 'الاحد ',
                  value: 'طلب قرض من قبل محمد بميلغ 3000\$',
                  date: '22/10/2022',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/order_details_screen');
                    },
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            margin: EdgeInsetsDirectional.only(
                                bottom: index == 5 ? 0 : 15),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F2F2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.5),
                                  child: Icon(
                                    Icons.monetization_on,
                                    color: Color(0xFFCA50CA),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 320,
                                      height: 50,
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
                                      height: 50,
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
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
