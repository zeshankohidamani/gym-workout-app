import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDialog {
  static showDialog({String title = "Loading..."}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 40,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static hideLoading() {
    Get.back();
  }

  static showErrorDialog(
      {String title = "Oops Error",
      String description = "Something went wrong"}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            Text(description),
          ],
        ),
      ),
    ));
  }
}
