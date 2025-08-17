import 'package:flutter/material.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/widgets/text_field_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: secondryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFieldWidget(
                controller: _searchController,
                hintText: "search anim or manga",
                obscureText: false,
                keyboard: TextInputType.multiline,
              ),
            ),
            SizedBox(height: 40),
            Container(
              // margin: EdgeInsets.all(2),
              padding: EdgeInsets.symmetric(vertical: 1),
              // margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: secondryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 13, 4, 63),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 46),
                      child: Text("anime"),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 13, 4, 63),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text("manga"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 10),

              decoration: BoxDecoration(
                color: secondryColor,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_sharp, size: 50),
                    SizedBox(height: 10),
                    Text("Start Your Search"),
                    SizedBox(height: 10),
                    Text(
                      "Enter keywords to find your anime or manga",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
