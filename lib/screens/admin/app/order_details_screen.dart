import 'package:bankplus/widget/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'تفاصيل الطلب',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 19,
            color: const Color(0xFF060606),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFF8F8F8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const order_detailse_screen(
                  titel: 'القيمة المالية المطلوب اقتراضها', money: '3000\$'),
              const order_detailse_screen(titel: 'الضربية', money: '25\$'),
              const order_detailse_screen(
                  titel: 'المبلغ الكلي', money: '3000\$'),
              const order_detailse_screen(
                  titel: 'تاريخ الطلب', money: '3000\$'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'سبب القرض',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: const Color(0xFF060606),
                      ),
                    ),
                    const Text(
                        'السبب الذي تحتاج من اجله القرض السبب الذي تحتاج من اجله القرضالسبب الذي تحتاج من اجله القرضالسبب الذي تحتاج من اجله القرض'),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCA50CA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'قبول',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'رفض',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFCA50CA)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
