import 'package:flutter/material.dart';

import 'package:frontend/screens/market.dart';
import 'package:frontend/screens/profile.dart';
import 'package:frontend/screens/trade.dart';
import 'package:frontend/screens/watchlist.dart';
import 'package:frontend/screens/connect.dart';
import 'package:frontend/util/error_screen.dart';

class BottomNavBar extends StatefulWidget {
  static const routeName = 'bottomNavigation_screen';
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _load = false;
  var _isError = false;
  //final authObj = Auth();
  int _selectedPage = 0;
  void onTabChangedListener(position) {
    setState(() {
      _selectedPage = position;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widList = [
      MarketScreen(),
      ConnectScreen(),
      TradeScreen(),
      WatchListScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      body: _isError
          ? ErrorScreen(
              message: "something went wrong",
              reload: () {},
            )
          : _load
              ? const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                )
              : widList[_selectedPage],
      bottomNavigationBar: SizedBox(
        height: 86,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          unselectedItemColor: Colors.black38,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.trending_up_sharp,
              ),
              label: 'Market',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sms_rounded,
              ),
              label: 'Connect',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.paid_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_outlined,
              ),
              label: 'Watchlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedPage,
          onTap: onTabChangedListener,
        ),
      ),
    );
  }
}
