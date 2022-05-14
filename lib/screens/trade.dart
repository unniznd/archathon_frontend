import 'package:flutter/material.dart';
import 'package:frontend/screens/buy.dart';
import 'package:frontend/screens/sell.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              indicatorWeight: 2,
              unselectedLabelStyle: TextStyle(color: Colors.white54),
              tabs: [
                Tab(text: "Buy"),
                Tab(text: "Sell"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              BuyScreen(),
              SellScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
