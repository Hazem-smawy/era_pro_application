import 'package:era_pro_application/src/features/home/presentation/pages/home_page.dart';
import 'package:era_pro_application/src/features/home/presentation/widgets/navigation_taps_widget.dart';
import 'package:era_pro_application/src/features/main_info/presentation/pages/main_info_page.dart';
import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  late List<Widget> pages;

  late int index;
  @override
  void initState() {
    super.initState();
    pages = [
      const HomePage(),
      const MainInfoPage(),
    ];
    setState(() {
      index = 0;
    });
  }

  PageController pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: pageController,
              reverse: true,
              children: [
                ...pages,
              ],
            ),
            NavigationTapsWidget(pageController: pageController, index: index),
          ],
        ),
      ),
    );
  }
}
