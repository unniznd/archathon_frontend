import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/screens/market_detail.dart';

import '../main.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  Stream? get_price() async* {
    while (true) {
      var res = await http.get(
        Uri.parse("http://10.0.2.2:8000/price/"),
        headers: {
          "Authorization":
              "Token " + (await storage.read(key: "token")).toString(),
        },
      );
      if (res.statusCode == 200) {
        final Map r = json.decode(res.body);
        yield r['data'];
      }
    }
  }

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
            repeatForever: true,
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
      body: StreamBuilder(
        stream: get_price(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/" +
                        snapshot.data[index]["short"] +
                        ".png"),
                  ),
                  title: Text(snapshot.data[index]["name"]),
                  subtitle: Text(snapshot.data[index]["short"]),
                  trailing: Text(snapshot.data[index]['price'].toString()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MarketDetailScreen(
                          snapshot.data[index]["short"] + "USDT",
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
