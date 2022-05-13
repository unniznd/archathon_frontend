import 'package:flutter/material.dart';

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
        title: Text(
          "CrpytMaster",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          // Icon(
          //   Icons.favorite,
          //   color: Colors.black,
          //   size: 35,
          // ),
          // SizedBox(
          //   width: 10,
          // ),
        ],
      ),
      body: ListView(
        children: [
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
