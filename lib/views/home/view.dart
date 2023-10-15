import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/views/home/pages/favs/view.dart';
import 'package:project1/views/home/pages/main/view.dart';
import 'package:project1/views/home/pages/my_account/view.dart';
import 'package:project1/views/home/pages/my_orders/view.dart';
import 'package:project1/views/home/pages/notification/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> pages = const [
    MainPage(),
    MyOrdersPage(),
    NotificationPage(),
    FavsPage(),
    MyAccountPage(),
  ];

  List<String> titles = [
    "الرئيسية",
    "طلباتي",
    "الإشعارات",
    "المفضله",
    "حسابي",
  ];

  List<String> icons = [
    "home",
    "my_orders",
    "notification",
    "favs",
    "my_account"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xffAED489),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: List.generate(
          pages.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/svg/${icons[index]}.svg",
              color: currentIndex == index
                  ? Colors.white
                  : const Color(0xffAED489),
            ),
            label: titles[index],
          ),
        ),
      ),
    );
  }
}
