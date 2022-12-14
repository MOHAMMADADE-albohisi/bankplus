// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:bankplus/database/controllers/admin_db_controller.dart';
import 'package:bankplus/helpers/constexe_extenssion.dart';
import 'package:bankplus/model_db/process_response.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginAdminScreen extends StatefulWidget {
  const LoginAdminScreen({Key? key}) : super(key: key);

  @override
  State<LoginAdminScreen> createState() => _LoginAdminScreenState();
}

class _LoginAdminScreenState extends State<LoginAdminScreen> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late bool showpasssword = true;
  late TapGestureRecognizer richtextcontroller;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    richtextcontroller = TapGestureRecognizer();
    richtextcontroller.onTap = createnewacountclick;
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
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
              'البريد الالكتروني',
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
              controller: _emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                hintText: 'ادخل عنوان بريد الالكتروني',
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
              controller: _passwordTextEditingController,
              keyboardType: TextInputType.text,
              style: GoogleFonts.poppins(),
              obscureText: showpasssword,
              decoration: InputDecoration(
                hintText: 'ادخل كلمة المرور',
                hintStyle: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    color: const Color(0xFFD2D7E9),
                    fontWeight: FontWeight.w400),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => {showpasssword = !showpasssword});
                  },
                  icon: Icon(
                    showpasssword ? Icons.visibility_off : Icons.visibility,
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
    if (_emailTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      return true;
    }

    context.ShowSnakBar(message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> login() async {
    processResponse ProcessResponse = await AdminDbController().login(
        email: _emailTextEditingController.text,
        password: _passwordTextEditingController.text);
    if (ProcessResponse.success) {
      Navigator.pushReplacementNamed(
          context, '/bottom_admin_navigation_screen');
    }
    context.ShowSnakBar(
        message: ProcessResponse.message, error: !ProcessResponse.success);

    // Admin admin = Admin();
    // admin.email = 'admin@admin.com';
    // admin.password = '12345';
    // admin.branch = 'فرع الوسطى';
    // admin.name = 'Admin1';
    // ServicesDbController().createadmin(admin);
  }

}


