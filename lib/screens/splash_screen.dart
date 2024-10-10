import 'dart:async'; // For Timer
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For navigation to WelcomeScreen
import 'package:google_fonts/google_fonts.dart';
import 'user_screen.dart'; // Make sure the path is correct

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Animation setup
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward(); // Start the animation

    // Fade animation from 0 to 1 (transparent to visible)
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Scale animation to scale the image slightly up (from 0.8 to 1)
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Timer to navigate to the UserScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Get.off(const UserScreen()); // Automatically navigate to UserScreen
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Container(
             decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 248, 248, 247), Color(0xff56ab2f)], // Green gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Add the image for your splash screen
                  Image.asset(
                    'assets/images/mybus.png', // Replace with your image path
                    height: 200, // Adjust the size as needed
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'My Bus', // Text shown on the splash screen
                    style: GoogleFonts.fahkwang(
                      textStyle: const TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 40, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
