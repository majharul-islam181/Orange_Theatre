
import 'package:flutter/material.dart';
import 'package:orange_theatre/config/colors/color.dart';
import 'package:orange_theatre/utils/constant.dart';
import 'package:orange_theatre/views/Dashboard%20Animation/AnimationHomePage.dart';
import 'package:orange_theatre/views/explore/explore_root.dart';
import 'package:orange_theatre/views/widgets/bottombar_item.dart';
import 'package:lottie/lottie.dart'; // Import the Lottie package

import '../views.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  int _activeTabIndex = 0;
  DateTime? _lastPressed;

  final List _barItems = [
    {
      "icon": "assets/icons/home.svg",
      "page": const AnimationHomePage(),
    },
    {
      "icon": "assets/icons/search copy.svg",
      "page": const ExploreRoot(),
    },
    {
      "icon": "assets/icons/location.svg",
      "page": NearbyTheatersScreen(),
    },
    {
      "icon": "assets/icons/favorite-border.svg",
      "page": const FavouriteScreen(),
    },
  ];

  //====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: ANIMATED_BODY_MS),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  _buildAnimatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    if (index == _activeTabIndex) return;
    _controller.reset();
    setState(() {
      _activeTabIndex = index;
    });
    _controller.forward();
  }

  //====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppColor.appBgColor,
        bottomNavigationBar: _buildBottomBar(),
        body: _buildPage(),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    if (_lastPressed == null ||
        now.difference(_lastPressed!) > const Duration(seconds: 2)) {
      _lastPressed = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Press again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      return Future.value(false);
    }

    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            Lottie.asset(
              'assets/lottie/Animation - 1725384646971.json',
              width: 120,
              height: 120,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 16),
          ],
        ),
        content: const Text(
          'Do you want to exit the app?',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    return shouldExit ?? false;
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _activeTabIndex,
      children: List.generate(
        _barItems.length,
        (index) => _buildAnimatedPage(_barItems[index]["page"]),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            _barItems.length,
            (index) => BottomBarItem(
              _barItems[index]["icon"],
              isActive: _activeTabIndex == index,
              activeColor: Colors.red,
              onTap: () => onPageChanged(index),
            ),
          ),
        ),
      ),
    );
  }
}
