import 'package:flutter/material.dart';

import 'package:frontend/switcher/bottomnavbar.dart';

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
        body: BottomNavBar(),
      ),
    );
  }
}
