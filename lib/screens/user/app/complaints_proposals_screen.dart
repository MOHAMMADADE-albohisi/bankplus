  import 'package:bankplus/helpers/constexe_extenssion.dart';
  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';

  // ignore: camel_case_types
  class ComplaintsProposalsScreen extends StatefulWidget {
    const ComplaintsProposalsScreen({Key? key}) : super(key: key);

    @override
    State<ComplaintsProposalsScreen> createState() =>
        _ComplaintsProposalsScreenState();
  }

  // ignore: camel_case_types
  class _ComplaintsProposalsScreenState extends State<ComplaintsProposalsScreen>
      with SingleTickerProviderStateMixin {
    late TabController _tabController;
    late TextEditingController _cityTextEditingController;
    late TextEditingController _infoTextEditingController;

    late TextEditingController _infoTSuggestionextEditingController;
    late TextEditingController _suggestionTextEditingController;

    @override
    void initState() {
      super.initState();
      _cityTextEditingController = TextEditingController();
      _infoTextEditingController = TextEditingController();

      _suggestionTextEditingController = TextEditingController();
      _infoTSuggestionextEditingController = TextEditingController();

      _tabController = TabController(length: 2, vsync: this);
    }

    @override
    void dispose() {
      _cityTextEditingController.dispose();
      _infoTextEditingController.dispose();
      _suggestionTextEditingController.dispose();
      _infoTSuggestionextEditingController.dispose();
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
            'الشكاوي والمقترحات',
            style: GoogleFonts.poppins(
                fontSize: 15,
                color: const Color(0xFF060606),
                fontWeight: FontWeight.bold),
          ),
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
                    color: Color(0xFFCA50CA),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  controller: _tabController,
                  labelColor: const Color(0xFF000000),
                  tabs: const [
                    Tab(text: 'شكوى'),
                    Tab(text: 'اقتراح'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 28),
                            Text(
                              'العنوان',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF000000),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              controller: _cityTextEditingController,
                              keyboardType: TextInputType.text,
                              style: GoogleFonts.poppins(),
                              decoration: InputDecoration(
                                hintText: 'ادخل العنوان',
                                hintStyle: GoogleFonts.nunitoSans(
                                    fontSize: 14,
                                    color: const Color(0xFFD2D7E9),
                                    fontWeight: FontWeight.w400),
                                hintMaxLines: 1,
                                enabledBorder: buildOutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade700,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'الوصف',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF000000),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              controller: _infoTextEditingController,
                              keyboardType: TextInputType.text,
                              style: GoogleFonts.poppins(),
                              maxLength: 9,
                              decoration: InputDecoration(
                                hintText: 'الوصف',
                                hintStyle: GoogleFonts.nunitoSans(
                                    fontSize: 14,
                                    color: const Color(0xFFD2D7E9),
                                    fontWeight: FontWeight.w400),
                                counterText: '',
                                hintMaxLines: 1,
                                enabledBorder: buildOutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade700,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                            const SizedBox(height: 163),
                            Visibility(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
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
                                    onPressed: () => performasuggestion(),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      'ارسال الطلب',
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
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 28),
                          Text(
                            'العنوان',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF000000),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: _infoTSuggestionextEditingController,
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.poppins(),
                            decoration: InputDecoration(
                              hintText: 'ادخل العنوان',
                              hintStyle: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  color: const Color(0xFFD2D7E9),
                                  fontWeight: FontWeight.w400),
                              hintMaxLines: 1,
                              enabledBorder: buildOutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'الوصف',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF000000),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: _suggestionTextEditingController,
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.poppins(),
                            decoration: InputDecoration(
                              hintText: 'الوصف',
                              hintStyle: GoogleFonts.nunitoSans(
                                  fontSize: 14,
                                  color: const Color(0xFFD2D7E9),
                                  fontWeight: FontWeight.w400),
                              hintMaxLines: 1,
                              enabledBorder: buildOutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                          const SizedBox(height: 163),
                          Visibility(
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
                                  onPressed: () => performascomplaint(),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'ارسال الطلب',
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    OutlineInputBorder buildOutlineInputBorder({Color color = Colors.grey}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color),
      );
    }

    Future<void> performasuggestion() async {
      if (_checkData()) {
        complaint();
      }
    }

    bool _checkData() {
      if (_cityTextEditingController.text.isNotEmpty &&
          _infoTextEditingController.text.isNotEmpty) {
        return true;
      }

      context.ShowSnakBar(message: 'Enter Required Data', error: true);
      return false;
    }

    Future<void> complaint() async {
     //
    }

  //****************************************************************
    Future<void> performascomplaint() async {
      if (_checkData1()) {
        suggestion();
      }
    }

    bool _checkData1() {
      if (_suggestionTextEditingController.text.isNotEmpty &&
          _infoTSuggestionextEditingController.text.isNotEmpty) {
        return true;
      }

      context.ShowSnakBar(message: 'Enter Required Data', error: true);
      return false;
    }

    Future<void> suggestion() async {
      //
    }
  }
