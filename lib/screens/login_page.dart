import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';

import 'homes_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginInPageState createState() => _LoginInPageState();
}

String _localhost() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return '192.168.2.108:3000';
  } else {
    return 'localhost:3000';
  }
}

class _LoginInPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future? serverResponse;

  Future<void> _login() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    if (kDebugMode) {
      print('Email: $email');
      print('Password: $password');
    }
    final response = await http.post(
      Uri.http(_localhost(), '/user/login'),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      }, // เพิ่ม header Content-Type
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password
      }), // แปลงข้อมูลเป็น JSON
    );
    if (!context.mounted) return;

    if (response.statusCode == 200) {
      // Successful login
      var decodeData = jsonDecode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomesPage()),
      );
      return decodeData;
      // Handle the decoded response data accordingly
    } else {
      // Failed login
      if (kDebugMode) {
        print("Login Failed: ${response.body}");
      }

      Fluttertoast.showToast(msg: 'Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFF375735),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/background-tree.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  key: _formKey,
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36.0,
                          color: Color(0xFF375735),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      InputField(
                        controller: _emailController,
                        label: 'Email',
                        placeholder: 'example@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 25.0),
                      InputField(
                        controller: _passwordController,
                        label: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 25.0),
                      ElevatedButton(
                        onPressed: _login, // Call the _login function
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFF375735),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
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

class InputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  const InputField({
    Key? key,
    required this.label,
    this.placeholder = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 2.0,
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF375735),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: placeholder,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
