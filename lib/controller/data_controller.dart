import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_project/controller/auth_controller.dart';

class DataController extends GetxController {
  final firebaseInstance = FirebaseFirestore.instance;
  Map userProfileInstance = {'userName': '', 'joinDate': ''};
  String name = "";

  User? current;

  AuthController authController = Get.find();

  void onReady() {
    super.onReady();
    getUserProfileData();
  }

  Future<void> getUserProfileData() async {
    try {
      var response = await firebaseInstance
          .collection('userslist')
          .where('user_Id', isEqualTo: authController.userId)
          .get();
      name = response.docs[0]['user_name'];
      print(name);
    } catch (e) {
      print(e);
    }
  }

  Future<QuerySnapshot> UserData() async {
    var response = await firebaseInstance
        .collection('userslist')
        .where('user_Id', isEqualTo: authController.userId)
        .get();
    name = response.docs[0]['user_name'];
    print(name);
    print("*********************************");
    return response;
  }

  Future<bool> changePurchaseBool() async {
    bool value;
    // print(authController.userId);
    var response = await firebaseInstance
        .collection("userslist")
        .where('user_Id', isEqualTo: authController.userId)
        .get();
    value = response.docs[0]['isPurchase'];
    print("before saving: $value");
    var collection = await firebaseInstance.collection('userslist');

    collection.doc(authController.userId).update(
      {'isPurchase': !value},
    );
    print('after saving : ${!value}');
    return value;
  }

  Future<bool> getPurchaseBoolValue() async {
    var response = await firebaseInstance
        .collection('userlist')
        .where('user_Id', isEqualTo: authController.userId)
        .get();
    print("inside datacontroller : ${response.docs[0]['isPurchase']}");
    return response.docs[0]['isPurchase'];
  }
}
