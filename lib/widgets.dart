import 'package:flutter/material.dart';

import 'constants.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color bgColor;
  final double radius;
  late double? width;
  late Function() func;

  ButtonWidget({Key? key,
    required this.title,
    required this.bgColor,
    required this.func,
    required this.radius,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: SizedBox(
        height: 45,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(
                color: bgColor == Colors.blueAccent
                    ? Colors.blueAccent
                    : Colors.blue,
                width: 1,
              ),
            ),
          ),
          onPressed: func,
          child: Text(
            title,
            style: kHeadingNormalTextStyle.copyWith(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class FixedSpace extends StatelessWidget {
  late final double? ht;
  late final double? wd;

  FixedSpace({Key? key, this.ht, this.wd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ht,
      width: wd,
    );
  }
}

class CardWidget extends StatelessWidget {
  final String level;

  const CardWidget({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: const Color(0xff383563ff),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "I'm",
              style: kCardHeadingTextStyle,
            ),
            Text(
              level,
              style: kCardHeadingTextStyle,
            ),
            FixedSpace(
              ht: 5,
            ),
            Text(
              "I have trained\nserveral times",
              style: kHeadingNormalTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  Function(String) onChange;
  String labelText;
  late TextInputType? textInputType;
  bool obscureTextBool;

  TextFieldWidget({
    required this.onChange,
    required this.labelText,
    required this.obscureTextBool,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureTextBool,
      onChanged: onChange,
      keyboardType: textInputType,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        label: Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
