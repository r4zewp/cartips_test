import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../codes/code_page_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  final String route = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  /// Current page index
  int _curIndex = 1;

  /// Setting up pages list.
  /// Settings and profile are mock data.
  List<Widget> pages = const [
    Center(child: Text('Settings')),
    CodePageView(),
    Center(child: Text('Profile'))
  ];

  /// PageController
  final PageController pageCtrl = PageController(initialPage: 1);

  /// Method animates to page on [newIndex]
  /// And updates [_curIndex] with [newIndex]
  /// When new BottomNavBar item is chosen.
  void updatePage(int newIndex) {
    if (newIndex != _curIndex) {
      setState(() => _curIndex = newIndex);
      pageCtrl.animateToPage(newIndex,
          duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: size.height * (100 / 772),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
          child: BottomNavyBar(
            backgroundColor: const Color(0xff211F1F),
            showElevation: false,
            iconSize: 20,
            itemCornerRadius: 100,
            selectedIndex: _curIndex,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            onItemSelected: (int value) => updatePage(value),
            curve: Curves.easeIn,
            items: [
              BottomNavyBarItem(
                icon: Icon(
                  Icons.settings,
                  color: _curIndex == 0 ? Colors.black : Colors.white,
                ),
                title: Text(
                  AppLocalizations.of(context)!.settingsNavBarItem,
                  style: const TextStyle(color: Colors.black),
                ),
                textAlign: TextAlign.center,
                activeColor: const Color(0xffCDC1FF),
                inactiveColor: Colors.white,
              ),
              BottomNavyBarItem(
                icon: Icon(
                  Icons.qr_code_outlined,
                  color: _curIndex == 1 ? Colors.black : Colors.white,
                ),
                title: Text(
                  AppLocalizations.of(context)!.homepageTitle,
                  style: const TextStyle(color: Colors.black),
                ),
                textAlign: TextAlign.center,
                activeColor: const Color(0xffCDC1FF),
                inactiveColor: Colors.white,
              ),
              BottomNavyBarItem(
                icon: Icon(
                  Icons.person,
                  color: _curIndex == 2 ? Colors.black : Colors.white,
                ),
                title: Text(
                  AppLocalizations.of(context)!.profileNavBarItem,
                  style: const TextStyle(color: Colors.black),
                ),
                textAlign: TextAlign.center,
                activeColor: const Color(0xffCDC1FF),
                inactiveColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageCtrl,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
    );
  }
}
