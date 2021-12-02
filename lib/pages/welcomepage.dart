import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_project/constants.dart';
import 'package:workout_project/pages/about_you.dart';
import 'package:workout_project/pages/sign_in_page.dart';
import '../widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/9.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.linearToSrgbGamma(),
            ),
          ),
          child: GestureDetector(
            onTap: (){
              Get.to(const SignInPage());
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Touch to  ",
                          style: kHeadingBebasNeueTextStyle,
                        ),
                        Text(
                          "Continue",
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
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome",
                          style: kHeadingNormalTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FixedSpace(ht: 10),
                        Text(
                          "Train and live the new experience of\nexercising at home",
                          textAlign: TextAlign.center,
                          style: kHeadingNormalTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        FixedSpace(ht: 10),
                        // ButtonWidget(
                        //   width: double.infinity,
                        //   title: "Try Now",
                        //   radius: 40,
                        //   bgColor: Colors.blueAccent,
                        //   func: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => const AboutYou(),
                        //       ),
                        //     );
                        //   },
                        // ),
                        // ButtonWidget(
                        //   width: double.infinity,
                        //   title: "Login",
                        //   radius: 40,
                        //   bgColor: Colors.black,
                        //   func: () {
                        //     Get.to(const SignInPage());
                        //   },
                        // ),
                      ],
                    ),
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
