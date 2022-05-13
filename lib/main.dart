import 'package:flutter/material.dart';

import 'package:frontend/switcher/bottomnavbar.dart';
import 'package:frontend/screens/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/screens/register.dart';

const storage = FlutterSecureStorage();

void main() {
  runApp(const ArchathonApp());
}

class ArchathonApp extends StatefulWidget {
  const ArchathonApp({super.key});

  @override
  State<ArchathonApp> createState() => _ArchathonAppState();
}

class _ArchathonAppState extends State<ArchathonApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: FutureBuilder(
        //   future: storage.read(key: "token"),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       if (snapshot.data == null) {
        //         return LoginScreen();
        //       }

        //       return BottomNavBar();
        //     }
        //     return Scaffold();
        //   },
        // ),
        body: RegisterScreen(),
      ),
    );
  }
}
