import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/view/widgets/setting_screen.dart';

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
      body = SettingScreen();
    } else if (_bottomindex == 1) {
      body = SettingScreen();
    } else if (_bottomindex == 2) {
      body = SettingScreen();
    } else if (_bottomindex == 3) {
      body = SettingScreen();
    }

    return Scaffold(
      backgroundColor: primaryColor,

      appBar: _appBar(),
      body: body,
      bottomNavigationBar: _bottomnavigation(),
    );
  }

  //   bottom navigator
  BottomNavigationBar _bottomnavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      onTap: (index) {
        _bottomnavigatingpages(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events),
          label: "msg15".tr(context),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder_copy),
          label: "msg16".tr(context),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "msg17".tr(context),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "msg18".tr(context),
        ),
      ],
    );
  }

  //   App Bar
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

      title: Text("msg17".tr(context), style: appTheme.textTheme.bodyMedium),
    );
  }
}
