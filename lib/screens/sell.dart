import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'dart:math';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  List<String> coins = ['', 'BTC', 'ETH', 'DOGE', 'DOT'];

  final TextEditingController quantity = new TextEditingController();
  final TextEditingController price = new TextEditingController();

  Future<Map> get_profile() async {
    Map r = {};
    while (true) {
      var res = await http.get(
        Uri.parse("https://archathonbackendserver.herokuapp.com/profile/"),
        headers: {
          "Authorization":
              "Token " + (await storage.read(key: "token")).toString(),
        },
      );
      if (res.statusCode == 200) {
        r = json.decode(res.body);
        return r;
      }
      return r;
    }
  }

  Stream? get_price(String index) async* {
    while (true) {
      var res = await http.get(
        Uri.parse("https://archathonbackendserver.herokuapp.com/price/" +
            index +
            "USDT" +
            "/"),
        headers: {
          "Authorization":
              "Token " + (await storage.read(key: "token")).toString(),
        },
      );
      if (res.statusCode == 200) {
        final Map r = json.decode(res.body);
        yield r;
      }
    }
  }

  String? index = '';

  double current_price = 0;
  double cash_in_hand = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: get_profile(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  cash_in_hand = snapshot.data["cash_in_hand"].toDouble();
                  return ListTile(
                    leading: Text(
                      "Balance",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    trailing: Text(
                      "USDT " + (snapshot.data["cash_in_hand"].toString()),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              child: DropdownButton<String>(
                underline: SizedBox(),
                isExpanded: true,
                value: index,
                items: coins.map((index) {
                  return DropdownMenuItem<String>(
                    value: index,
                    child: Text(index),
                  );
                }).toList(),
                onChanged: (index) {
                  setState(() {
                    this.index = index.toString();
                  });
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            if (index != '')
              StreamBuilder(
                key: Key("${Random().nextDouble()}"),
                stream: get_price(index.toString()),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    current_price = snapshot.data["price"];
                    return ListTile(
                      leading: Text("Price"),
                      trailing: Text(snapshot.data["price"].toString()),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: quantity,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Quantity',
                label: Text('Quantity'),
                suffixText: index,
                //suffixStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                print("on change called");
                String txt = '';
                setState(() {
                  this.index = index;
                  this.quantity.text = text;
                  if (text != '')
                    txt = (double.parse(text) * current_price).toString();
                });
                if (txt != '') if (double.parse(txt) <= cash_in_hand)
                  this.price.text = txt;
                else
                  this.price.text = '';
                else
                  this.price.text = '';
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: price,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Price',
                label: Text('Price'),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Sell",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurpleAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
