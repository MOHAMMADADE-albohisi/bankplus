import 'package:bankplus/database/controllers/user_db_controller.dart';
import 'package:bankplus/helpers/constexe_extenssion.dart';
import 'package:bankplus/model_db/process_response.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController mobileTextEditingController;
  late TextEditingController passwordTextEditingController;
  late bool _showpasssword = true;
  late TapGestureRecognizer richtextcontroller;

  @override
  void initState() {
    super.initState();
    mobileTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    richtextcontroller = TapGestureRecognizer();
    richtextcontroller.onTap = createnewacountclick;
  }

  @override
  void dispose() {
    mobileTextEditingController.dispose();
    passwordTextEditingController.dispose();
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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'تسجيل الدخول',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: const Color(0xFF000000),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 9),
          Center(
            child: Image.asset('images/Vector.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'رقم الهوية',
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
              controller: mobileTextEditingController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(),
              maxLength: 9,
              decoration: InputDecoration(
                hintText: 'ادخل رقم الهوية',
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
              'كلمة المرور',
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
              controller: passwordTextEditingController,
              keyboardType: TextInputType.text,
              style: GoogleFonts.poppins(),
              obscureText: _showpasssword,
              decoration: InputDecoration(
                hintText: 'ادخل كلمة المرور',
                hintStyle: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    color: const Color(0xFFD2D7E9),
                    fontWeight: FontWeight.w400),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => {_showpasssword = !_showpasssword});
                  },
                  icon: Icon(
                    _showpasssword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
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
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/verify_the_number_screen');
              },
              child: Text(
                'نسيت كلمة المرور؟',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: const Color(0xFFCA50CA),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
                    'تسجيل الدخول',
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
            child: RichText(
              text: TextSpan(
                  text: 'هل ليس لديك حساب؟  ',
                  style: GoogleFonts.nunito(
                    color: Colors.grey.shade700,
                  ),
                  children: [
                    TextSpan(
                        text: 'سجل الان',
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
    if (mobileTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty) {
      return true;
    }

    context.ShowSnakBar(message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> login() async {
    // ignore: non_constant_identifier_names
    processResponse ProcessResponse = await UserDbController().login(
        identification: mobileTextEditingController.text,
        password: passwordTextEditingController.text);
    if (ProcessResponse.success) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/bottom_navigatio_screen');
    }
    // ignore: use_build_context_synchronously
    context.ShowSnakBar(
      message: ProcessResponse.message,
      error: !ProcessResponse.success,
    );
  }
}
