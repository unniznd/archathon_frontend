import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/screens/market_detail.dart';
import 'package:frontend/util/error_screen.dart';

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
      );
      if (res.statusCode == 200) {
        final Map r = json.decode(res.body);
        yield r['data'];
      }
      yield Null;
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
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "http://10.0.2.2:8000" + snapshot.data[index]["logo"],
                      ),
                    ),
                    title: Text(snapshot.data[index]["name"]),
                    subtitle: Text(snapshot.data[index]["short"]),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(snapshot.data[index]['price'].toString()),
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
                  );
                },
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
