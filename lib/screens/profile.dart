import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Username",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.share,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 40,
                  child: Text("AH"),
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text("Wallet Id"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
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
      ),
    );
  }
}
