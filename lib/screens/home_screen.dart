import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign/screens/setting_creen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  int _bottomindex = 0;
  void _bottomnavigatingpages(index) {
    setState(() {
      _bottomindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? body;
    if (_bottomindex == 0) {
      body = SettingCreen();
    } else if (_bottomindex == 1) {
      body = SettingCreen();
    } else if (_bottomindex == 2) {
      body = SettingCreen();
    } else if (_bottomindex == 3) {
      body = SettingCreen();
    }

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: _appBar(),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _bottomnavigatingpages(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Top Anime",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy),
            label: "Top Managa",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings ",
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          icon: Icon(Icons.logout_rounded),
        ),
      ],
      titleSpacing: 20,
      leadingWidth: 5,
      leading: Icon(Icons.emoji_events),

      title: Text(
        "Top Anime",
        style: GoogleFonts.robotoCondensed(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
