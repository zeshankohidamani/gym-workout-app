import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:workout_project/pages/welcomepage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Center(child: Text("App not Connected"));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const WelcomePage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(child: CircularProgressIndicator());
      },
    ),
    );
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: WelcomePage(),
    // );
  }
}
