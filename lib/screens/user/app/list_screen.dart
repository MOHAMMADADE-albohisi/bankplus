import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(''),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          const Divider(),
          Row(
            children: [
              Image.asset('images/Vector1.png'),
              const SizedBox(width: 12),
              Text(
                'الشكاوي والمقترحات ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF0000000),
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/complaints_proposals_screen');
                },
                icon: const Icon(
                  Icons.chevron_right,
                  size: 40,
                ),
                color: const Color(0xFFC2C2C2),
              )
            ],
          ),
          const SizedBox(height: 29),
          Row(
            children: [
              Image.asset('images/Vector1.png'),
              const SizedBox(width: 12),
              Text(
                'حول التطبيق',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF0000000),
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  size: 40,
                ),
                color: const Color(0xFFC2C2C2),
              )
            ],
          ),
          const SizedBox(height: 29),
          Row(
            children: [
              Image.asset('images/Vector1.png'),
              const SizedBox(width: 12),
              Text(
                'الدعم الفني',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF0000000),
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  size: 40,
                ),
                color: const Color(0xFFC2C2C2),
              )
            ],
          ),
          const SizedBox(height: 362),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/login_screen');
            },
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.logout),
                  color: const Color(0xFFCA50CA),
                ),
                const SizedBox(width: 12),
                Text(
                  'تسجيل الخروج',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF0000000),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
