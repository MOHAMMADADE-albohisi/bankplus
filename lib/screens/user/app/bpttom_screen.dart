import 'package:bankplus/widget/bottom_widget.dart';
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
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined),
            color: const Color(0xFF060606),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                indicator: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                controller: _tabController,
                labelColor: const Color(0xFF000000),
                tabs: const [
                  Tab(
                    text: 'قيد الانتضار',
                  ),
                  Tab(text: 'قيد المراجعة'),
                  Tab(text: 'مقبول'),
                  Tab(text: 'مرفوض'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                home_bottome_widget(
                    image: 'coin',
                    titel: 'الطلب في حالةانتضار الموافقة عليه',
                    datename: 'الاحد ',
                    value: '3000\$',
                    date: '22/10/2022'),

                home_bottome_widget(
                    image: 'coin2',
                    titel: 'الطلب قيد المراجعة',
                    datename: 'الاحد ',
                    value: '3000\$',
                    date: '22/10/2022'),

                home_bottome_widget(
                    image: 'coin3',
                    titel: 'الطلب مقبول ',
                    datename: 'الاحد ',
                    value: '3000\$',
                    date: '22/10/2022'),

                home_bottome_widget(
                    image: 'coin4',
                    titel: 'الطلب في مرفوض',
                    datename: 'الاحد ',
                    value: '3000\$',
                    date: '22/10/2022'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
