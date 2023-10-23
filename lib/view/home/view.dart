import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar/view/home/main/view.dart';
import 'package:themar/view/home/my_account/view.dart';
import 'package:themar/view/home/my_faves/view.dart';
import 'package:themar/view/home/my_notification/view.dart';
import 'package:themar/view/home/my_orders/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> pages = [
    MainPage(),
    OrdersPage(),
    NotificationPage(),
    FavesPage(),
    AccountPage(),
  ];
  List<String> titles = [
    'الرئيسية',
    'طلباتي',
    'الإشعارات',
    'المفضلة',
    'حسابي',
  ];
  List<String> icons = [
    'home',
    'order',
    'notification',
    'faves',
    'account',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          unselectedItemColor: const Color(0xffAED489),
          selectedItemColor: Colors.white,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: List.generate(
            pages.length,
            (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset('asset/icon/svg/${icons[index]}.svg',color: currentIndex == index ? Colors.white : null,),
              label: titles[index],
            ),
          )),
    );
  }
}
