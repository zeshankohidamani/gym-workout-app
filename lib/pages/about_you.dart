import 'package:flutter/material.dart';
import 'package:workout_project/constants.dart';
import 'package:workout_project/pages/sign_in_page.dart';
import '../widgets.dart';

class AboutYou extends StatelessWidget {
  const AboutYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/16.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About You",
                        style: kHeadingNormalTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FixedSpace(ht: 10),
                      Text(
                        "We want to know more about you, follow the next\n"
                        "steps to complete the information",
                        style: kHeadingNormalTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      FixedSpace(
                        ht: 20,
                      ),
                      Row(
                        children: [
                          const CardWidget(
                            level: "Beginner",
                          ),
                          FixedSpace(
                            wd: 10,
                          ),
                          const CardWidget(
                            level: "Expert",
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white.withOpacity(0.5),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Back',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(
                                  100,
                                  30,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInPage(),
                                  ),
                                );
                              },
                              child: const Text("Next"),
                            ),
                          ],
                        ),
                      ),
                    ],
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
