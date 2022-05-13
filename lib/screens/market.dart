import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:frontend/screens/market_detail.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 26,
            color: Colors.black,
          ),
          child: AnimatedTextKit(
            pause: Duration(milliseconds: 2000),
            animatedTexts: [
              TyperAnimatedText(
                'CrpytMaster',
                speed: Duration(milliseconds: 100),
              ),
              TyperAnimatedText(
                'Market',
                speed: Duration(milliseconds: 100),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => MarketDetailScreen(),
                ),
              );
            },
            leading: CircleAvatar(
              child: Icon(Icons.abc),
            ),
            title: Text("Coin Name"),
            subtitle: Text("CN"),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text("329.201"),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "+0.21%",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.abc),
            ),
            title: Text("Coin Name"),
            subtitle: Text("CN"),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text("329.201"),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "+0.21%",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.abc),
            ),
            title: Text("Coin Name"),
            subtitle: Text("CN"),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text("329.201"),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "+0.21%",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
