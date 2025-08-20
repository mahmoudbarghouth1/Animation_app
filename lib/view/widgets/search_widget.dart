import 'package:flutter/material.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/widgets/text_field_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: secondryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFieldWidget(
                controller: searchController,
                hintText: "msg28".tr(context),
                obscureText: false,
                keyboard: TextInputType.multiline,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              // margin: EdgeInsets.all(2),
              padding: const EdgeInsets.symmetric(vertical: 1),
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
                      padding: const EdgeInsets.symmetric(horizontal: 46),
                      child: Text("msg24".tr(context)),
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
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child:  Text("msg25".tr(context)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: height * .50,
              padding: const EdgeInsets.symmetric(horizontal: 10),

              decoration: BoxDecoration(
                color: secondryColor,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.search_sharp, size: 50),
                    const SizedBox(height: 10),
                     Text("msg26".tr(context)),
                    const SizedBox(height: 10),
                     Text(
                     "msg27".tr(context),
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
