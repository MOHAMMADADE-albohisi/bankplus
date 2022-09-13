import 'package:bankplus/Prefs/shared_preferences.dart';
import 'package:bankplus/database/controllers/services_db_controller.dart';
import 'package:bankplus/helpers/constexe_extenssion.dart';
import 'package:bankplus/model_db/lone.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoanRequestScreen extends StatefulWidget {
  const LoanRequestScreen({Key? key}) : super(key: key);

  @override
  State<LoanRequestScreen> createState() => _LoanRequestScreenState();
}

class _LoanRequestScreenState extends State<LoanRequestScreen> {
  late TextEditingController _valueTextEditingController;
  late TextEditingController _infoTextEditingController;
  late TapGestureRecognizer richtextcontroller;

  @override
  void initState() {
    super.initState();
    _valueTextEditingController = TextEditingController();
    _infoTextEditingController = TextEditingController();
    richtextcontroller = TapGestureRecognizer();
    richtextcontroller.onTap = createnewacountclick;
  }

  @override
  void dispose() {
    _valueTextEditingController.dispose();
    _infoTextEditingController.dispose();
    richtextcontroller.dispose();

    super.dispose();
  }

  void createnewacountclick() {
    Navigator.pushNamed(context, '/regester_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'طلب قرض',
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF060606),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'القيمة المالية المطلوب اقتراضها',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _valueTextEditingController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                hintText: 'ادخل القيمة المالية',
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'سبب القرض',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _infoTextEditingController,
              keyboardType: TextInputType.text,
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                hintText: 'السبب الذي تحتاج من اجله القرض',
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          const SizedBox(height: 400),
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
                  onPressed: () => performaSentRequest(),
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
          const SizedBox(height: 12),
          Center(
              child: Row(
            children: [
              RichText(
                text: TextSpan(
                    text: 'بالنقر فوق زر ارسال الطلب ، فإنك توافق على  ',
                    style: GoogleFonts.nunito(
                      color: Colors.grey.shade700,
                    ),
                    children: [
                      TextSpan(
                          text: 'الشروط والأحكام وسياسة الخصوصية',
                          recognizer: richtextcontroller,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFFCA50CA),
                            fontWeight: FontWeight.bold,
                            decorationStyle: TextDecorationStyle.solid,
                            decoration: TextDecoration.underline,
                          ))
                    ]),
              ),
            ],
          )),
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

  Future<void> performaSentRequest() async {
    if (_checkData()) {
      login();
    }
  }

  bool _checkData() {
    if (_valueTextEditingController.text.isNotEmpty &&
        _infoTextEditingController.text.isNotEmpty) {
      return true;
    }

    context.ShowSnakBar(message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> login() async {
    Services services = Services();
    services.amount = int.parse(_valueTextEditingController.text);
    services.info = _infoTextEditingController.text;
    services.typeName = 'test';
    services.user_id = SharedPrefController().getValueFor(savedata.userId.name);
    services.state = 'الطلب قيد المراجعة';
    services.infoLoan = '';
    services.document = '';
    services.date = '${DateTime.now()}';
    bool tests = await ServicesDbController().create(services);
    if (tests == true) {
      Navigator.pushReplacementNamed(context, '/successful_operation_screen');
    } else {
      context.ShowSnakBar(message: 'حدث خطا ما', error: true);
    }

    // ignore: use_build_conte
  }
}
