import 'package:b_dazzled/widgets/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../resources/global_variable.dart';
import './add_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // void NavigationTapped(int page) {
  //   pageController.jumpToPage(page);
  // }

  void onpageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: const Text(
          'LOgIfY',
          style: TextStyle(
              fontFamily: 'Charm',
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPostScreen.routeName);
            },
            icon: Icon(
              Icons.add,
              size: 25,
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: PageView(
        children: homescreenItems,
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onpageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey.shade900,
        selectedItemColor:
            // Theme.of(context).colorScheme.secondary
            Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.home,
              color: _page == 0 ? Colors.white : Colors.grey.shade900,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.search,
              color: _page == 1 ? Colors.white : Colors.grey.shade900,
            ),
            label: '',
          ),
          // BottomNavigationBarItem(
          //   backgroundColor: Theme.of(context).primaryColor,
          //   icon: const Icon(Icons.add_circle),
          //   label: '',
          // ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.notifications,
              color: _page == 2 ? Colors.white : Colors.grey.shade900,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.message_outlined,
              color: _page == 3 ? Colors.white : Colors.grey.shade900,
            ),
            label: '',
          ),
        ],
        // onTap: NavigationTapped,
      ),
    );
  }
}
