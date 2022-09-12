import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7, initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Image.asset('images/Vector.png'),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  Text(
                    'مرحبا دينا',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'اهلا بعودتك',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_active_outlined),
              ),
            ],
          ),
          const Divider(thickness: 1),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 150),
            child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int pageIndex) {},
                itemBuilder: (context, index) {
                  return Card(
                    // المسافة بين الصورتين
                    margin:
                        EdgeInsetsDirectional.only(end: index != 2 ? 10 : 0),
                    child: Image.asset(
                      'images/Card Empty.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  );
                }),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'اطلب خدمتك',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 140),
                  child: GridView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisCount: 1,
                              // mainAxisExtent: 100
                              childAspectRatio: 80 / 100),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset('images/Transfer.png'),
                              const SizedBox(height: 1),
                              Text(
                                'القروض',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: const Color(0xFF696A6B),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  height: 75,
                                  child: Text(
                                    'بأمكانك من خلال التطبيق سحب القرض بالقيمة التي تريدها بكل سهولة.',
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      'العمليات الاخيرة',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 230,
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
