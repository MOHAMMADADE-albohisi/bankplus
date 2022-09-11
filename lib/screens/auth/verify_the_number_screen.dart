import 'package:bankplus/helpers/constexe_extenssion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyTheNumberScreen extends StatefulWidget {
  const VerifyTheNumberScreen({Key? key}) : super(key: key);

  @override
  State<VerifyTheNumberScreen> createState() => _VerifyTheNumberScreenState();
}

class _VerifyTheNumberScreenState extends State<VerifyTheNumberScreen> {
  late TextEditingController mobileTextEditingController;

  @override
  void initState() {
    super.initState();
    mobileTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    mobileTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'التحقق من الرقم',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  '  قمنا بإرسال رسالة SMS قصيرة تحتوي على رمز التفعيل لرقمك',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Color(0xFFCA50CA),
                  ),
                ),
                Text(
                  '+970598595579',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
                    color: Color(0xFFB7B1B7),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: mobileTextEditingController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(),
              maxLength: 4,
              decoration: InputDecoration(
                hintText: 'ادخل رمز التفعيل ',
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
                  onPressed: () => performaLogin(),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text(
                    'تحقق',
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
          SizedBox(height: 24),
          const SizedBox(height: 12),
          Center(
            child: RichText(
              text: TextSpan(
                  text: 'اعادة ارسال الرمز في ',
                  style: GoogleFonts.nunito(
                    color: Colors.grey.shade700,
                  ),
                  children: [
                    TextSpan(
                      text: '00:52 ',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFFCA50CA),
                        fontWeight: FontWeight.w500,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    )
                  ]),
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

  Future<void> performaLogin() async {
    if (_checkData()) {
      login();
    }
  }

  bool _checkData() {
    if (mobileTextEditingController.text.isNotEmpty) {
      return true;
    }

    context.ShowSnakBar(message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> login() async {
    Navigator.pushNamed(context, '/restore_password_screen');
  }
}
