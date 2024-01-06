import 'package:flutter/material.dart';
import 'package:nothing/color/all_colors.dart';
import 'package:nothing/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: AppColor().blue,
        ),
        fontFamily: 'Poppins',
        hintColor: AppColor().CardHeadingColor,
        primaryColor: Colors.teal,
        backgroundColor: AppColor().buttonColor,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
    );
  }
}
