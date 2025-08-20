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
    // int x = ref.read(bottomNavigatorProvider.notifier).state;
    // // log(x.toString());
    if (ref.read(bottomNavigatorProvider.notifier).state == 0) {
      body = TopAnimeWidget();
      appBarTitle = "msg15".tr(context);
    } else if (ref.read(bottomNavigatorProvider.notifier).state == 1) {
      body = TopMangaWidget();
      appBarTitle = "msg16".tr(context);
    } else if (ref.read(bottomNavigatorProvider.notifier).state == 1) {
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
          icon: const Icon(Icons.emoji_events),
          label: "msg15".tr(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.folder_copy),
          label: "msg16".tr(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: "msg17".tr(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: "msg18".tr(context),
        ),
      ],
    );
  }

  //   App Bar
  AppBar _appBar(context, appBarTitle) {
    return AppBar(
      leading: const Icon(Icons.emoji_events, color: Colors.white60),

      title: Text(appBarTitle),
    );
  }
}

// things that could be done:

// 1. Extract navigation logic to constants
// class NavigationConstants {
//   static const int animeTab = 0;
//   static const int mangaTab = 1;
//   static const int searchTab = 2;
//   static const int settingsTab = 3;
// }

// 2. Extract widgets to separate methods for better readability
// Widget _buildBody() {
//   final currentIndex = ref.watch(bottomNavigatorProvider);
//   
//   switch (currentIndex) {
//     case NavigationConstants.animeTab:
//       return const TopAnimeWidget();
//     case NavigationConstants.mangaTab:
//       return const TopMangaWidget();
//     case NavigationConstants.searchTab:
//       return const SearchWidget();
//     case NavigationConstants.settingsTab:
//       return const SettingWidget();
//     default:
//       return const TopAnimeWidget();
//   }
// }

// 3. Extract app bar title logic
// String _getAppBarTitle() {
//   final currentIndex = ref.watch(bottomNavigatorProvider);
//   
//   switch (currentIndex) {
//     case NavigationConstants.animeTab:
//       return "msg15".tr(context);
//     case NavigationConstants.mangaTab:
//       return "msg16".tr(context);
//     case NavigationConstants.searchTab:
//       return "msg17".tr(context);
//     case NavigationConstants.settingsTab:
//       return "msg18".tr(context);
//     default:
//       return "msg15".tr(context);
//   }
// }

// 4. Fix the bug in navigation logic (search tab should be index 2, not 1)
// if (ref.read(bottomNavigatorProvider.notifier).state == 0) {
//   body = TopAnimeWidget();
//   appBarTitle = "msg15".tr(context);
// } else if (ref.read(bottomNavigatorProvider.notifier).state == 1) {
//   body = TopMangaWidget();
//   appBarTitle = "msg16".tr(context);
// } else if (ref.read(bottomNavigatorProvider.notifier).state == 2) { // Fixed: was 1
//   body = SearchWidget();
//   appBarTitle = "msg17".tr(context);
// } else if (ref.read(bottomNavigatorProvider.notifier).state == 3) {
//   body = SettingWidget();
//   appBarTitle = "msg18".tr(context);
// }

// 5. Extract bottom navigation to separate widget
// class _BottomNavigation extends ConsumerWidget {
//   const _BottomNavigation({Key? key}) : super(key: key);
//   
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       currentIndex: ref.watch(bottomNavigatorProvider),
//       onTap: (index) {
//         ref.read(bottomNavigatorProvider.notifier).update((state) => index);
//       },
//       items: [
//         BottomNavigationBarItem(
//           icon: const Icon(Icons.emoji_events),
//           label: "msg15".tr(context),
//         ),
//         BottomNavigationBarItem(
//           icon: const Icon(Icons.folder_copy),
//           label: "msg16".tr(context),
//         ),
//         BottomNavigationBarItem(
//           icon: const Icon(Icons.search),
//           label: "msg17".tr(context),
//         ),
//         BottomNavigationBarItem(
//           icon: const Icon(Icons.settings),
//           label: "msg18".tr(context),
//         ),
//       ],
//     );
//   }
// }

// 6. Extract app bar to separate widget
// class _AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   
//   const _AppBarWidget({Key? key, this.title}) : super(key: key);
//   
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: const Icon(Icons.emoji_events, color: Colors.white60),
//       title: Text(title ?? ''),
//     );
//   }
//   
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// 8. Add proper error handling for navigation
// Widget _buildBody() {
//   try {
//     final currentIndex = ref.watch(bottomNavigatorProvider);
//     return _getWidgetForIndex(currentIndex);
//   } catch (e) {
//     return ErrorWidget('Navigation error: $e');
//   }
// }

// 9. Add loading states for each tab
// Widget _getWidgetForIndex(int index) {
//   switch (index) {
//     case NavigationConstants.animeTab:
//       return const TopAnimeWidget();
//     case NavigationConstants.mangaTab:
//       return const TopMangaWidget();
//     case NavigationConstants.searchTab:
//       return const SearchWidget();
//     case NavigationConstants.settingsTab:
//       return const SettingWidget();
//     default:
//       return const Center(child: Text('Unknown tab'));
//   }
// }

// 10. Consider adding tab persistence
// final tabPersistenceProvider = StateProvider<int>((ref) {
//   // Load from shared preferences or other storage
//   return 0;
// });
