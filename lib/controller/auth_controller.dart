import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:workout_project/controller/commondialog.dart';
import 'package:workout_project/pages/categoriespage.dart';

class AuthController extends GetxController {
  var userId;

  Future<void> signUp(email, password, username, phone) async {
    try {
      CommonDialog.showDialog();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password);
      print(userCredential);
      CommonDialog.hideLoading();
      try {
        CommonDialog.showDialog();
        var response =
            await FirebaseFirestore.instance.collection('userslist').add(
              {
                'user_Id': userCredential.user!.uid,
                'user_name': username,
                'password': password,
                'phone': phone,
                'joinDate': DateTime.now().microsecondsSinceEpoch,
                'email': email,
              }
            );
        print("Firebase response1111 ${response.id}");
        CommonDialog.hideLoading();
        Get.back();
      } catch (e) {
        CommonDialog.hideLoading();
        CommonDialog.showErrorDialog(description: "Error Saving data at FireStore $e");
      }

      Get.back();
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      if (e.code == 'weak-password') {
        CommonDialog.showErrorDialog(
            description: "The password provided is too weak.");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CommonDialog.showErrorDialog(
            description: "The account already exists for that email.");
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(description: "Something went wrong");
    }
  }

  Future<void> login(email, password) async {
    try {
      CommonDialog.showDialog();
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      print(userCredential.user!.uid);
      userId = userCredential.user!.uid;
      CommonDialog.hideLoading();
      Get.off( CategoriesPage());
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      if (e.code == 'user-not-found') {
        CommonDialog.showErrorDialog(
            description: "No user found for that email.");
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CommonDialog.showErrorDialog(
            description: "Wrong password provided for that user.");
        print('Wrong password provided for that user.');
      }
    }
  }
}
