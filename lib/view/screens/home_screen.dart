import 'dart:developer' show log;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/view/widgets/search_widget.dart';
import 'package:sign/view/widgets/setting_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sign/view/widgets/topanime_widget.dart';
import 'package:sign/view/widgets/topmanga_widget.dart';
import 'package:sign/viewmodel/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    Widget? body;
    String? appBarTitle;
    int x = ref.read(bottomNavigatorProvider.notifier).state;
    // log(x.toString());
    if (ref.read(bottomNavigatorProvider.notifier).state == 0) {
      body = TopAnimeWidget();
      appBarTitle = "msg15".tr(context);
    } else if (ref.read(bottomNavigatorProvider.notifier).state == 1) {
      body = TopMangaWidget();
      appBarTitle = "msg16".tr(context);
    } else if (ref.read(bottomNavigatorProvider.notifier).state == 2) {
      body = SearchWidget();
      appBarTitle = "msg17".tr(context);
    } else if (ref.read(bottomNavigatorProvider.notifier).state == 3) {
      body = SettingWidget();
      appBarTitle = "msg18".tr(context);
    }

    return Scaffold(
      backgroundColor: primaryColor,

      appBar: _appBar(context, appBarTitle),
      body: body,
      bottomNavigationBar: _bottomnavigation(context),
    );
  }

  //   bottom navigator
  BottomNavigationBar _bottomnavigation(context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: ref.watch(bottomNavigatorProvider),

      onTap: (index) {
        ref.read(bottomNavigatorProvider.notifier).state = index;
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
  AppBar _appBar(context, appBarTitle) {
    return AppBar(
      leading: Icon(Icons.emoji_events, color: Colors.white60),

      title: Text(appBarTitle),
    );
  }
}
