import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:workout_project/constants.dart';
import 'package:workout_project/controller/data_controller.dart';
import 'package:workout_project/pages/chat_screen.dart';
import 'package:workout_project/pages/profile_page.dart';
import 'package:workout_project/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CategoriesPage extends StatefulWidget {
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  DataController dataController = Get.put(DataController());
  late bool purchaseBool = false;

  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'b4fNr03orxA',
    'W-jPRE_D058',
    'DD5oEcN_VOM',
    'FIRBV0EkEzY',
    'hveOZMOysaA',
    '14wdIXJHONI',
    'NBtFqeGjfig',
    'd5Lvn3FtfxE',
    'wu_uJzxvvgw',
    'ICBXg2ZXMvc',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
    CheckPurchaseBool();
  }

  CheckPurchaseBool() async {
    var response = await dataController.UserData();
    setState(() {
      purchaseBool = response.docs[0]['isPurchase'];
    });
    print("purchaseBool: $purchaseBool");
  }

  ChangePurchaseBool() async {
    var response = await dataController.UserData();
    setState(() {
      purchaseBool = !response.docs[0]['isPurchase'];
    });
    print("**********************\n"
        "after change purchasee call purchaseBool: $purchaseBool");
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  List popularImage = ['1', '2', '3', '4'];
  List popularString = [
    'Dribble Exercises',
    'Combine Exercises',
    'Push-Up Exercises',
    'Dribble Exercises',
  ];
  List popularUrl = [
    's8taXR3mYa8',
    'vYCIqtJ1UiE',
    'cXzglB3l-sE',
    'ARLCRMKu6as'
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
      Get.to(ChatScreen());
    } else if (index == 2) {
      Get.to(Profile_page());
    }
  }

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
              icon: Icon(Icons.chat),
              label: 'Chat',
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
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: myHeight / 2,
                  width: double.infinity,
                  color: Colors.black,
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
                                backgroundImage:
                                    AssetImage("assets/images/5.jpg"),
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
                            GestureDetector(
                              onTap: () {
                                ChangePurchaseBool();
                                setState(() {});
                                print("hi");
                              },
                              child: Text(
                                "your Workout",
                                style: kHeadingBebasNeueTextStyle.copyWith(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // TODO: Place for the Search Workout
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      dataController.changePurchaseBool();
                                      print("hey");

                                      print(
                                          'inside the UI: ${dataController.changePurchaseBool()}');
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
                            // Expanded(
                            //   flex: 2,
                            //   child: TextField(
                            //     enabled: _isPlayerReady,
                            //     controller: _idController,
                            //     decoration: InputDecoration(
                            //       border: InputBorder.none,
                            //       hintText:
                            //       'Enter youtube \<video id\> or \<link\>',
                            //       fillColor: Colors.blueAccent.withAlpha(20),
                            //       filled: true,
                            //       hintStyle: const TextStyle(
                            //         fontWeight: FontWeight.w300,
                            //         color: Colors.blueAccent,
                            //       ),
                            //       suffixIcon: _loadCueButton('LOAD'),
                            //     ),
                            //   ),
                            // ),
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
                                  if (playListIndex == 0) {
                                    return Card(
                                      color: Colors.black,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              print("hey");
                                              Get.defaultDialog(
                                                middleText:
                                                    "Purchase: $purchaseBool",
                                                title: "Payment!",
                                              );
                                              var id =
                                                  YoutubePlayer.convertUrlToId(
                                                        popularUrl[index],
                                                      ) ??
                                                      '';
                                              _controller.load(id);
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/${popularImage[index]}.jpg"),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              height: 130,
                                              width: 130,
                                            ),
                                          ),
                                          FixedSpace(
                                            ht: 10,
                                          ),
                                          Text(
                                            popularString[index] != ""
                                                ? popularString[index]
                                                : "Loading",
                                            style: kParaTextStyle,
                                          ),
                                        ],
                                      ),
                                    );
                                  } else if (playListIndex == 1) {
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: 130,
                                            width: 130,
                                          ),
                                          FixedSpace(
                                            ht: 10,
                                          ),
                                          Text(
                                            hardWorkoutString[index] != ""
                                                ? hardWorkoutString[index]
                                                : "Loading",
                                            style: kParaTextStyle,
                                          ),
                                        ],
                                      ),
                                    );
                                  } else if (playListIndex == 2) {
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: 130,
                                            width: 130,
                                          ),
                                          FixedSpace(
                                            ht: 10,
                                          ),
                                          Text(
                                            fullBodyString[index] != ""
                                                ? fullBodyString[index]
                                                : "Loading",
                                            style: kParaTextStyle,
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: 130,
                                            width: 130,
                                          ),
                                          FixedSpace(
                                            ht: 10,
                                          ),
                                          Text(
                                            crossFitString[index] != ""
                                                ? crossFitString[index]
                                                : "Loading",
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
                    Positioned(
                      child: Visibility(
                        visible: !purchaseBool,
                        child: Container(
                          height: myHeight / 2,
                          width: double.infinity,
                          color: Colors.green.withOpacity(0.7),
                          child: const Center(
                            child: Text(
                              "You need to Purchase",
                              style: kHeadingNormalBoldTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 254,
              child: YoutubePlayerBuilder(
                onExitFullScreen: () {
                  // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
                  SystemChrome.setPreferredOrientations(
                      DeviceOrientation.values);
                },
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.black,
                  topActions: <Widget>[
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        _controller.metadata.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 25.0,
                      ),
                      onPressed: () {},
                    ),
                  ],
                  onReady: () {
                    _isPlayerReady = true;
                  },
                  onEnded: (data) {
                    _controller.load(
                        _ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
                    // _showSnackBar('Next Video Started!');
                  },
                ),
                builder: (context, player) => Scaffold(
                  body: ListView(
                    children: [
                      player,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _space,
                            _space,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.black,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                        _idController.text,
                      ) ??
                      '';
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  // _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
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
