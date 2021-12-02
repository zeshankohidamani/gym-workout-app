import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_project/constants.dart';
import 'package:workout_project/controller/auth_controller.dart';
import 'package:workout_project/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

mixin InputValidationMixin {
  bool isPasswordValid(String password){
    return password.length == 6;
  }

  bool isEmailValid(String email) {
    RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }
}

class _SignUpPageState extends State<SignUpPage> with InputValidationMixin{
  late String email,password,username,phone;
  AuthController authController = Get.find();
  final formGlobalKey = GlobalKey<FormState>();

  signUp(){
    authController.signUp(email, password, username, phone);
  }


  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height - 40;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formGlobalKey,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage('assets/images/4.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign Up",
                            style: kHeadingNormalTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FixedSpace(
                            ht: 5,
                          ),
                          const Text(
                            "Train and live the new experience of\n"
                            "exercising at home",
                            style: kParaTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextFieldWidget(
                            validator: (name){
                              if(name == ""){
                                return 'Please Enter the Name';
                              }
                            },
                            onChange: (value) {
                              username = value;
                            },
                            labelText: "Name",
                            textInputType: TextInputType.name,
                            obscureTextBool: false,
                          ),
                          TextFieldWidget(
                            validator: (email){
                              if(isEmailValid(email!)){
                                return null;
                              }else {
                                return 'Enter a valid email';
                              }
                            },
                            onChange: (value) {
                              email = value;
                            },
                            labelText: "Email",
                            textInputType: TextInputType.emailAddress,
                            obscureTextBool: false,
                          ),
                          TextFieldWidget(
                            validator: (value){
                              RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                              if (value!.isEmpty) {
                                return 'Please enter mobile number';
                              }
                              else if (!regExp.hasMatch(value)) {
                                return 'Please enter valid mobile number';
                              }
                              return null;
                            },
                            onChange: (value) {
                              phone = value;
                            },
                            labelText: "Phone",
                            textInputType: TextInputType.phone,
                            obscureTextBool: false,
                          ),
                          TextFieldWidget(
                            validator: (value){
                              RegExp regex =
                              RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              } else {
                                if (!regex.hasMatch(value)) {
                                  return 'Enter valid password';
                                } else {
                                  return null;
                                }
                              }
                            },
                            onChange: (value) {
                              password = value;
                            },
                            labelText: "Password",
                            obscureTextBool: true,
                          ),
                          // TextFieldWidget(
                          //   onChange: (value) {},
                          //   labelText: "Confirm Password",
                          //   obscureTextBool: true,
                          // ),
                          FixedSpace(
                            ht: 10,
                          ),
                          const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "By signing up, I agree to the GYM workout User\n"
                              "Agreement and Privacy Policy.",
                              style: kParaTextStyle,
                            ),
                          ),
                          FixedSpace(
                            ht: 15,
                          ),
                          ButtonWidget(
                            width: double.infinity,
                            title: "Register",
                            bgColor: Colors.blueAccent,
                            func: () {
                              if(formGlobalKey.currentState!.validate()){
                                signUp();
                              }
                              // signUp();
                            },
                            radius: 5,
                          ),
                          ButtonWidget(
                            width: double.infinity,
                            title: "Cancel",
                            bgColor: Colors.black,
                            func: () {
                              Get.back();
                            },
                            radius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
