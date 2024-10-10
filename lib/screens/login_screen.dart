import 'package:bus/screens/home_screen.dart';
import 'package:bus/screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
 bool _isVisible = false;

 final Url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDaTtF1tIj9IYDx7S6k0ZVzkErWu-NFDy8";

 // email validation
 TextEditingController _emailCheck = TextEditingController();
  TextEditingController _passwordCheck = TextEditingController();

Future<void> logIn() async{
  // assign value
  final email = _emailCheck.text.trim();
  final password = _passwordCheck.text.trim();

  try {
    // Make API request to Firebase
    final res = await http.post(
      Uri.parse(Url),
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    // Check if the request was successful
    if (res.statusCode == 200) {
      // If successful, navigate to the HomeScreen
      Get.to(const HomeScreen());
    } else {
      // Show snackbar for an error if the response is not successful
      Get.showSnackbar(GetSnackBar(
        title: "LogIn Error",
        message: "Invalid LogIn details. Please try again.",
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
        icon: const Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        margin: const EdgeInsets.all(16),
      ));
    }
  } catch (e) {
    // Handle other errors and show a snackbar
    Get.showSnackbar(GetSnackBar(
      title: "Network Error",
      message: "Something went wrong. Please try again later.",
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
      icon: const Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 10,
      margin: const EdgeInsets.all(16),
    ));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xff56ab2f), Color.fromARGB(255, 238, 241, 236)], // Green gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top image with proper decoration
                // Container(
                //   height: 220,
                //   width: double.infinity,
                //   decoration: const BoxDecoration(
                //     borderRadius: BorderRadius.only(
                //       bottomRight: Radius.circular(200),
                //     ),
                //     image: DecorationImage(
                //       image: NetworkImage(
                //         "https://media.istockphoto.com/id/1015377844/vector/family-traveling-by-car.jpg?s=2048x2048&w=is&k=20&c=MBICsJ9OUr-TOoCEvh0u0wMTORE6UD2BylHF2V33PLY=",
                //       ),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 30),
                      
                // Login heading
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Log In',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.cambo(
                      fontSize: 40,
                      color: const Color.fromARGB(255, 244, 245, 244),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                      
                // Phone number label and text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _emailCheck,
                        decoration: InputDecoration(
                          labelText: 'Enter your email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xFF005248),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xFF00A896),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Password label and text field
                      const Text(
                        'Password:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _passwordCheck,
                        obscureText: !_isVisible,
                        decoration: InputDecoration(
                          labelText: 'Enter your password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            icon: _isVisible ? Icon(Icons.visibility):Icon(Icons.visibility_off),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xFF005248),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xFF00A896),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      
                      // Remember me checkbox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF005248),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      
                      // Login button
                      Center(
                        child: ElevatedButton(
                          onPressed: logIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 63, 148, 66),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      // Forgot Password text
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'Forgot Password? ',
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Forgot Password button clicked');
                                // Add navigation to reset password screen here
                              },
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      
                      // Sign up row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Sign Up',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Sign Up button clicked');
                                  // Add navigation to Sign Up screen here
                                  Get.to(SignUpScreen());
                                },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}