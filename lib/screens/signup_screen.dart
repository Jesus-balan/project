import 'package:bus/screens/home_screen.dart';
import 'package:bus/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  bool isVisible = false;

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Validation messages
  String? _nameError;
  String? _emailError;
  String? _passwordError;

  // firebase 

   final Url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDaTtF1tIj9IYDx7S6k0ZVzkErWu-NFDy8";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 242, 243, 241), Color.fromARGB(255, 105, 202, 61)], // Green gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),),
        child: Container(          
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sign Up heading
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.cambo(
                        fontSize: 40,
                        color: const Color.fromARGB(255, 56, 126, 59),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
          
                  // Name TextField
                  _buildTextField(
                    label: 'Name:',
                    hint: 'Enter your name',
                    controller: _nameController,
                    errorText: _nameError,
                  ),
                  const SizedBox(height: 20),
          
                  // Email TextField
                  _buildTextField(
                    label: 'Email:',
                    hint: 'Enter your Email',
                    controller: _emailController,
                    errorText: _emailError,
                  ),
                  const SizedBox(height: 20),
          
                  // Password TextField
                  _buildPasswordField(),
                  const SizedBox(height: 15),
          
                  // Remember me checkbox and terms
                  _buildCheckboxWithTerms(),
                  const SizedBox(height: 10),
          
                  // Sign Up button
                  _buildSignUpButton(),
                  const SizedBox(height: 10),
          
                  // Forgot Password text
                  _buildForgotPasswordText(),
                  const SizedBox(height: 40),
          
                  // Sign up row
                  _buildLoginRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    String? errorText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: hint,
              errorText: errorText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 2, color: Color(0xFF005248)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 2, color: Color(0xFF00A896)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Password:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          TextField(
            controller: _passwordController,
            obscureText: !isVisible,
            decoration: InputDecoration(
              labelText: 'Enter your password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              icon: isVisible ? Icon(Icons.visibility):Icon(Icons.visibility_off),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 2, color: Color(0xFF005248)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 2, color: Color(0xFF00A896)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxWithTerms() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'I agree with your ',
                      style: const TextStyle(fontSize: 14, color: Color(0xFF005248)),
                    ),
                    TextSpan(
                      text: 'Terms of Service ',
                      style: const TextStyle(fontSize: 14, color: Color(0xFF00A896), fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: const TextStyle(fontSize: 14, color: Color(0xFF005248)),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(fontSize: 14, color: Color(0xFF00A896), fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _validateInputs,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 70, 184, 74),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

void _validateInputs() async {
  setState(() {
    // Reset error messages
    _nameError = null;
    _emailError = null;
    _passwordError = null;
  });

  // Validate name
  String name = _nameController.text.trim();
  if (name.isEmpty) {
    setState(() {
      _nameError = 'Please enter your name.';
    });
    return;
  }

  // Validate email
  String email = _emailController.text.trim();
  if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
    setState(() {
      _emailError = 'Please enter a valid email address.';
    });
    return;
  }

  // Validate password (minimum 6 characters)
  String password = _passwordController.text.trim();
  if (password.isEmpty || password.length < 6) {
    setState(() {
      _passwordError = 'Password must be at least 6 characters long.';
    });
    return;
  }

  try {
    // Make the HTTP POST request to Firebase
    final res = await http.post(
      Uri.parse(Url),
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
      headers: {"Content-Type": "application/json"},
    );

    // If the response status code is 200 (success)
    if (res.statusCode == 200) {
      final result = json.decode(res.body);

      // Clear text fields after successful signup
      _emailController.clear();
      _passwordController.clear();
      _nameController.clear();

      // Navigate to HomeScreen
      Get.to(const HomeScreen());
    } else {
      // Show error snackbar if registration failed
      Get.snackbar(
        "Sign Up Error",
        "Invalid sign-up details. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        borderRadius: 10,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
        icon: const Icon(Icons.error, color: Colors.white),
      );
    }
  } catch (e) {
    // Handle any errors that occur during the HTTP request
    Get.snackbar(
      "Error",
      "An unexpected error occurred. Please try again.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error, color: Colors.white),
    );
  }
}


  Widget _buildForgotPasswordText() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Forgot Password? ',
          style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline, fontSize: 16),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print('Forgot Password button clicked');
              // Add navigation to reset password screen here
            },
        ),
      ),
    );
  }

  Widget _buildLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Have an account? ", style: TextStyle(fontSize: 18)),
        Text.rich(
          TextSpan(
            text: 'Log In',
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Log In button clicked');
                // Navigate to the Login screen
                Get.to(const LoginScreen());
              },
          ),
        ),
      ],
    );
  }
}
