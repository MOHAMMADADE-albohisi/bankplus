// ignore_for_file: non_constant_identifier_names

import 'package:bankplus/database/controllers/user_db_controller.dart';
import 'package:bankplus/helpers/constexe_extenssion.dart';
import 'package:bankplus/model_db/process_response.dart';
import 'package:bankplus/model_db/regester_user.dart';
import 'package:bankplus/model_ui/country.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({Key? key}) : super(key: key);

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  late TextEditingController _idTextEditingController;
  late TextEditingController _mobileTextEditingController;
  late TextEditingController _nameTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TextEditingController _numberAcountTextEditingController;
  late bool showpasssword = false;
  late TapGestureRecognizer richtextcontroller;
  late String? gender = 'M';
  int? _selectedcountryid;

  @override
  void initState() {
    super.initState();
    _idTextEditingController = TextEditingController();
    _mobileTextEditingController = TextEditingController();
    _nameTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _numberAcountTextEditingController = TextEditingController();
    richtextcontroller = TapGestureRecognizer();
    richtextcontroller.onTap = createnewacountclick;
  }

  @override
  void dispose() {
    _idTextEditingController.dispose();
    _mobileTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _numberAcountTextEditingController.dispose();
    richtextcontroller.dispose();
    super.dispose();
  }

  final List<Country> _Countryss = <Country>[
    Country(id: 1, title: 'فرع الجنوب'),
    Country(id: 2, title: 'فرع الوسطى'),
    Country(id: 3, title: 'فرع الشمال'),
    Country(id: 4, title: 'فرع الوسطى'),
    Country(id: 5, title: 'فرع الرمال'),
  ];

  void createnewacountclick() {
    Navigator.pushNamed(context, '/login_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'تسجيل جديد',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: const Color(0xFF000000),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      constraints: const BoxConstraints(
                        maxHeight: 90,
                        maxWidth: 90,
                      ),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Image.asset('images/mohammad.jpeg'),
                    ),
                    const PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            size: 17,
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
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
              controller: _idTextEditingController,
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
              'الاسم كاملا',
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
              controller: _nameTextEditingController,
              keyboardType: TextInputType.text,
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                hintText: 'ادخل الاشم هنا',
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
          const SizedBox(height: 12),
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
                hintText: 'ادخل عنوان بريدك الالكتروني',
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
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: RadioListTile<String>(
                    title: Text(
                      'ذكر',
                      style: GoogleFonts.poppins(),
                    ),
                    value: 'M',
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() => gender = value);
                    },
                  ),
                ),
                const Spacer(),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: RadioListTile<String>(
                    title: Text(
                      'انثى',
                      style: GoogleFonts.poppins(),
                    ),
                    value: 'F',
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() => gender = value);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'رقم الجوال',
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
              controller: _mobileTextEditingController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                prefixText: '970',
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
          const SizedBox(height: 12),
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
              obscureText: true,
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'الفرع المصرفي ',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: const Color(0xFF060606),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
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
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        _Countryss.firstWhere((element) =>
                                            element.id ==
                                            _selectedcountryid).title,
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
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'رقم الحساب',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF060606),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _numberAcountTextEditingController,
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.poppins(),
                        maxLength: 7,
                        decoration: InputDecoration(
                          hintText: 'ادخل رقم الحساب',
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
                    ),
                  ],
                )),
              ],
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
                text: 'هل لديك حساب؟  ',
                style: GoogleFonts.nunito(
                  color: Colors.grey.shade700,
                ),
                children: [
                  TextSpan(
                    text: 'سجل الدخول الان',
                    recognizer: richtextcontroller,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFFCA50CA),
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.solid,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          RichText(
            text: TextSpan(
              text: 'بالنقر فوق زر تسجيل الدخول ، فإنك توافق على  ',
              style:
                  GoogleFonts.nunito(color: Colors.grey.shade700, fontSize: 15),
              children: [
                TextSpan(
                  text: 'الشروط والأحكام وسياسة الخصوصية',
                  recognizer: richtextcontroller,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFFCA50CA),
                    fontWeight: FontWeight.bold,
                    decorationStyle: TextDecorationStyle.solid,
                    decoration: TextDecoration.underline,
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

  Future<void> performaLogin() async {
    if (_checkData()) {
      regester();
    }
  }

  bool _checkData() {
    if (_idTextEditingController.text.isNotEmpty &&
        _mobileTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty &&
        _nameTextEditingController.text.isNotEmpty &&
        _emailTextEditingController.text.isNotEmpty &&
        _numberAcountTextEditingController.text.isNotEmpty) {
      return true;
    }

    context.ShowSnakBar(message: 'Enter Required Data', error: true);
    return false;
  }

  Future<void> regester() async {
    processResponse ProcessResponse =
        await UserDbController().register(user: user);
    if (ProcessResponse.success) {
      Navigator.pop(context);
    }
    // ignore: use_build_context_synchronously
    context.ShowSnakBar(
      message: ProcessResponse.message,
      error: !ProcessResponse.success,
    );
  }

  User get user {

    User user = User();
    user.identification = _idTextEditingController.text;
    user.name = _nameTextEditingController.text;
    user.email = _emailTextEditingController.text;
    user.password = _passwordTextEditingController.text;
    user.phoneNumber = _mobileTextEditingController.text;
    user.accountNumber = _numberAcountTextEditingController.text;

    return user;
  }
}
