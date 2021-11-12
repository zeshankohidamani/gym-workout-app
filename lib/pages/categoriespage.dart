import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_project/constants.dart';
import 'package:workout_project/controller/data_controller.dart';
import 'package:workout_project/pages/about_you.dart';
import 'package:workout_project/widgets.dart';

class CategoriesPage extends StatefulWidget {
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List popularImage = ['1', '2', '3', '4','5'];
  List popularString = [
    'Dribble Exercises',
    'Combine Exercises',
    'Push-Up Exercises',
    'Dribble Exercises',
    'Dribble Exercises',
  ];

  List hardWorkoutImage = ['5', '6', '7', '8'];
  List hardWorkoutString = [
    'Dribble Exercises',
    'Combine Exercises',
    'Push-Up Exercises',
    'Dribble Exercises',
  ];

  List fullBodyImage = ['9', '10', '11', '12'];
  List fullBodyString = [
    'Dribble Exercises',
    'Combine Exercises',
    'Push-Up Exercises',
    'Dribble Exercises',
  ];

  List crossFitImage = ['13', '14', '15', '16'];
  List crossFitString = [
    'Dribble Exercises',
    'Combine Exercises',
    'Push-Up Exercises',
    'Dribble Exercises',
  ];
  String playListTitle = "Popular Workout";
  int playListIndex = 0;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Get.to(AboutYou());
    }
  }

  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height - 96;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade900,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Workout',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightBlueAccent,
          onTap: _onItemTapped,
        ),
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
                        backgroundColor: Colors.lightBlueAccent,
                        child: Icon(
                          Icons.play_arrow,
                          size: 34,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Find ",
                          style: kHeadingBebasNeueTextStyle.copyWith(
                            color: Colors.lightBlueAccent,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "your Workout",
                          style: kHeadingBebasNeueTextStyle.copyWith(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    // TODO: Place for the Search Workout
                  ],
                ),
              ),
            ),
            Container(
              height: myHeight / 2,
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          categoriebuttonwidget(
                            title: "Popular",
                            func: () {
                              setState(() {
                                playListTitle = "Popular Workout";
                                playListIndex = 0;
                              });
                            },
                          ),
                          categoriebuttonwidget(
                            title: "Hard Workout",
                            func: () {
                              setState(() {
                                playListIndex = 1;
                                playListTitle = "Hard Workout";
                              });
                            },
                          ),
                          categoriebuttonwidget(
                            title: "Full body",
                            func: () {
                              setState(() {
                                playListTitle = "Full Body Workout";
                                playListIndex = 2;
                              });
                            },
                          ),
                          categoriebuttonwidget(
                            title: "CrossFit",
                            func: () {
                              setState(() {
                                playListTitle = "CrossFit Workout";
                                playListIndex = 3;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        playListTitle,
                        style: kHeadingNormalBoldTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if(playListIndex == 0) {
                            return Card(
                              color: Colors.black,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/${popularImage[index]}.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 130,
                                    width: 130,
                                  ),
                                  FixedSpace(
                                    ht: 10,
                                  ),
                                  Text(
                                    popularString[index]  != ""? popularString[index] : "Loading",
                                    style: kParaTextStyle,
                                  ),
                                ],
                              ),
                            );
                          }
                          else if(playListIndex == 1) {
                            return Card(
                              color: Colors.black,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/${hardWorkoutImage[index]}.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 130,
                                    width: 130,
                                  ),
                                  FixedSpace(
                                    ht: 10,
                                  ),
                                  Text(
                                    hardWorkoutString[index] != ""? hardWorkoutString[index] : "Loading",
                                    style: kParaTextStyle,
                                  ),
                                ],
                              ),
                            );
                          }
                          else if(playListIndex == 2) {
                            return Card(
                              color: Colors.black,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/${fullBodyImage[index]}.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 130,
                                    width: 130,
                                  ),
                                  FixedSpace(
                                    ht: 10,
                                  ),
                                  Text(
                                    fullBodyString[index] != ""? fullBodyString[index] : "Loading",
                                    style: kParaTextStyle,
                                  ),
                                ],
                              ),
                            );
                          }
                          else {
                            return Card(
                              color: Colors.black,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/${crossFitImage[index]}.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: 130,
                                    width: 130,
                                  ),
                                  FixedSpace(
                                    ht: 10,
                                  ),
                                  Text(
                                    crossFitString[index] != ""? crossFitString[index] : "Loading",
                                    style: kParaTextStyle,
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
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

class categoriebuttonwidget extends StatelessWidget {
  final String title;
  final Function() func;

  const categoriebuttonwidget({
    Key? key,
    required this.title,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: Colors.blueAccent,
            width: 1,
          ),
        ),
      ),
      onPressed: func,
      child: FittedBox(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
