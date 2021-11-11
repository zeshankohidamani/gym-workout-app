import 'package:flutter/material.dart';
import 'package:workout_project/constants.dart';
import 'package:workout_project/pages/about_you.dart';
import '../widgets.dart';

class Forget_Password extends StatelessWidget {
  const Forget_Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height - 40;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: myHeight,
            width: double.infinity,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: myHeight / 2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/5.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HARD  ",
                              style: kHeadingBebasNeueTextStyle,
                            ),
                            Text(
                              "ELEMENT",
                              style: kHeadingBebasNeueTextStyle.copyWith(
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 4,
                                offset: const Offset(2, 1),
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Forget Password",
                                style: kHeadingNormalTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              FixedSpace(ht: 10),
                              Text(
                                "Train and live the new experience of\nexercising at home",
                                style: kHeadingNormalTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              FixedSpace(ht: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: myHeight / 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FixedSpace(
                          ht: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            label: Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        FixedSpace(
                          ht: 30,
                        ),
                        ButtonWidget(
                          title: "Submit",
                          radius: 5,
                          bgColor: Colors.blueAccent,
                          func: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutYou(),
                              ),
                            );
                          },
                        ),
                        ButtonWidget(
                          title: "Cancel",
                          bgColor: Colors.black,
                          radius: 5,
                          func: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}