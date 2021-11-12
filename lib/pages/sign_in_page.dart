import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_project/constants.dart';
import 'package:workout_project/controller/auth_controller.dart';
import 'package:workout_project/pages/about_you.dart';
import 'package:workout_project/pages/categoriespage.dart';
import 'package:workout_project/pages/forget_password.dart';
import 'package:workout_project/pages/sign_up_page.dart';
import '../widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late String email, password;
  AuthController authController = Get.put(AuthController());

  login() {
    authController.login(email, password);
  }

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
                      image: AssetImage('assets/images/12.jpg'),
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
                                "Sign In",
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: myHeight / 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FixedSpace(
                          ht: 10,
                        ),
                        // Email Text Field
                        TextFieldWidget(
                          onChange: (value) {
                            email = value;
                          },
                          labelText: "Email",
                          textInputType: TextInputType.emailAddress,
                          obscureTextBool: false,
                        ),
                        // Password TextField
                        TextFieldWidget(
                          onChange: (value) {
                            password = value;
                          },
                          labelText: "Password",
                          obscureTextBool: true,
                        ),
                        FixedSpace(
                          ht: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Email: $email\n"
                                "Password: $password");
                            // Go to Forget Password Page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Forget_Password(),
                              ),
                            );
                          },
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Forgot the Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        FixedSpace(
                          ht: 30,
                        ),
                        ButtonWidget(
                          width: double.infinity,
                          title: "Login",
                          radius: 5,
                          bgColor: Colors.blueAccent,
                          func: login,
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const CategoriesPage(),
                          //   ),
                          // );
                        ),
                        ButtonWidget(
                          width: double.infinity,
                          title: "Sign Up",
                          bgColor: Colors.black,
                          func: () {
                            Get.to(() => SignUpPage());
                          },
                          radius: 5,
                        ),
                        FixedSpace(
                          ht: 20,
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
