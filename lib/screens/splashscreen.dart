import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nothing/screens/bottom_navigatorbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjust the duration as needed
    );

    _animation = Tween<Offset>(
      begin: Offset(-1.0, -0.5),
      end: Offset(1.0, 0.2),
    ).animate(_controller);

    // Start the animation
    _controller.forward();

    // Simulate a loading process with a delay
    Timer(Duration(seconds: 3), () {
      // Navigate to the home screen after the splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigatorBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated widget for the flight animation
            SlideTransition(
              position: _animation,
              child: Image.asset(
                'assets/images/s-logo.png', // Update with your actual icon asset
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 10),
            // Replace this with your app name or slogan
            Text(
              'Travel Karo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
