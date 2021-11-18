import 'package:flutter/material.dart';
import 'package:workout_project/widgets.dart';
import 'package:workout_project/constants.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({Key? key}) : super(key: key);

  @override
  _Profile_pageState createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height - 40;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 28,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/5.jpg"),
                      radius: 25,
                    ),
                  ),
                  FixedSpace(
                    wd: 5,
                  ),
                  Text(
                    "Zeshan Ul Haq",
                    style: kHeadingNormalTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            FixedSpace(
              ht: 15,
            ),
            Card(
              color: Colors.grey.shade900,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Email",
                          style: kWhiteColor,
                        ),
                        Text(
                          "zeshanulhaque@gmail.com",
                          style: kWhiteColor,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Phone",
                          style: kWhiteColor,
                        ),
                        Text(
                          "(92)333-9411708",
                          style: kWhiteColor,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.date_range,
                      color: Colors.white,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Join Date",
                          style: kWhiteColor,
                        ),
                        Text(
                          "Friday, 17 March 2021",
                          style: kWhiteColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FixedSpace(
              ht: 15,
            ),
            ButtonWidget(
              title: "Sign Out",
              bgColor: Colors.deepOrangeAccent,
              func: () {},
              radius: 5,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
