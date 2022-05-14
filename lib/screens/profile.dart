import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.share,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: get_profile(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.blue,
                          backgroundImage: AssetImage("assets/images/logo.jpg"),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data["username"],
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            Text(snapshot.data["wallet_id"].toString()),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Text(
                        "Cash in Hand",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        "USDT " + snapshot.data['cash_in_hand'].toString(),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.maxFinite,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.history,
                              color: Colors.black54,
                            ),
                            title: Text("Transaction History"),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.card_giftcard,
                              color: Colors.black54,
                            ),
                            title: Text("Coupons/Rewards"),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.token,
                              color: Colors.black54,
                            ),
                            title: Text("Token Trading"),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.wallet,
                              color: Colors.black54,
                            ),
                            title: Text("Wallet"),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.settings,
                              color: Colors.black54,
                            ),
                            title: Text("Settings"),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Colors.black,
                            ),
                            title: Text("Logout"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
