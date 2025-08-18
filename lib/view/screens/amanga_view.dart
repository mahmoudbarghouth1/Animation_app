import 'package:flutter/material.dart';
import 'package:sign/core/app_theme.dart';

class MangaView extends StatelessWidget {
  const MangaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 150,
                    child: Image.network(
                      "https://cdn.myanimelist.net/images/manga/2/253146.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("one piece ", maxLines: 1),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: secondryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 5),
                            Text("9.1"),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: secondryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("9.1"),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: secondryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("9.1"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 300,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("ADD To Favorit"),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Synoposis "),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 19, 28, 111),
                        ),
                        padding: EdgeInsets.all(15),

                        child: Text(
                          "Gol D. Roger, a man referred to as the King of the Pirates, is set to be executed by the World Government. But just before his demise, he confirms the existence of a great treasure, One Piece, located somewhere within the vast ocean known as the Grand Line. Announcing that One Piece can be claimed by anyone worthy enough to reach it, the King of the Pirates is executed and the Great Age of Pirates begins.\n\nTwenty-two years later, a young man by the name of Monkey D. Luffy is ready to embark on his own adventure, searching for One Piece and striving to become the new King of the Pirates. Armed with just a straw hat, a small boat, and an elastic body, he sets out on a fantastic journey to gather his own crew and a worthy ship that will take them across the Grand Line to claim the greatest status on the high seas.\n\n[Written by MAL Rewrite]",
                          maxLines: 10,
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Synoposis "),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 19, 28, 111),
                        ),
                        height: 300,
                        padding: EdgeInsets.all(10),

                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 10,
                              ),
                          children: [
                            Text("data1"),
                            Text("data2"),
                            Text("data3"),
                            Text("data4"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
