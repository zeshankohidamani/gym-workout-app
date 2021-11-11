import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_project/controller/auth_controller.dart';

class DataController extends GetxController {
  final firebaseInstance = FirebaseFirestore.instance;
  Map userProfileInstance = {'userName': '', 'joinDate': ''};
  String name = "";

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
}
