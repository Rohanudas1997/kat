import 'package:bottom_bar/bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kat_game/feature/home/ui/screen/dashboard.dart';
import 'package:kat_game/feature/authentication/ui/widget/login.dart';
import 'package:kat_game/feature/settings/ui/screen/settings_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    CollectionReference games = FirebaseFirestore.instance.collection('games');

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          const Dashboard(),
          SettingsPage(
            onLogoutTap: () {
              _controller.dispose();
            },
          ),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        backgroundColor: Colors.white,
        itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: theme.primaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
            activeColor: theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
