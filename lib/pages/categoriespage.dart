import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_project/constants.dart';
import 'package:workout_project/controller/data_controller.dart';

class CategoriesPage extends StatelessWidget {

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height - 40;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: myHeight / 2,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/3.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Row for Text and Image
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Row for Hey, and Ramdan
                        Row(
                          children: [
                            Text(
                              "Hey, ",
                              style: kHeadingBebasNeueTextStyle.copyWith(
                                color: Colors.lightBlueAccent,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              "Zee",
                              style: kHeadingBebasNeueTextStyle.copyWith(
                                fontSize: 25,
                                // color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 20,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage("assets/images/5.jpg"),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.blueAccent.withOpacity(0.5),
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.play_arrow,
                          size: 34,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text("hi"),
                  ],
                ),
              ),
            ),
            Container(
              height: myHeight / 2,
              width: double.infinity,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
