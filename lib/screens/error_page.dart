import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Error404Screen extends StatelessWidget {
  const Error404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 404 Image
              Image.asset(
                'assets/images/error.gif', // Add your custom error image
                height: 300,
            
              ),
              // const SizedBox(height: 30),
              // // Error message text
              // Text(
              //   '404 - Page Not Found',
              //   style: GoogleFonts.fahkwang(
              //     textStyle: const TextStyle(
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold,
              //       color: Color.fromARGB(255, 96, 161, 118), // Adjust color
              //     ),
              //   ),
              // ),
              const SizedBox(height: 15),
              Text(
                'The page you are looking for does not exist.',
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
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