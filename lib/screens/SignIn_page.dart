import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plantforyou/screens/login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cfpasswordController = TextEditingController();

  String _localhost() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return '192.168.2.36:3000';
    } else {
      return 'localhost:3000';
    }
  }

  Future<void> _register() async {
    final String firstname = _firstnameController.text.trim();
    final String lastname = _lastnameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String cfpassword = _cfpasswordController.text.trim();

    if (kDebugMode) {
      print('FirstName: $firstname');
      print('LastName: $lastname');
      print('Email: $email');
      print('Password: $password');
      print('ConfirmPassword: $cfpassword');
    }

    if (password != cfpassword) {
      Fluttertoast.showToast(msg: "Password mismatch");
      return;
    }

    final response = await http.post(
      Uri.http(_localhost(), '/user/register'),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      }, // เพิ่ม header Content-Type
      body: jsonEncode(<String, String>{
        "firstname": firstname,
        "lastname": lastname,
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
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
      return decodeData;
      // Handle the decoded response data accordingly
    } else {
      // Failed login
      if (kDebugMode) {
        print("Register Failed: ${response.body}");
      }

      Fluttertoast.showToast(msg: 'Register failed');
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
              Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset('assets/images/left-arrow.png'),
                  ),
                  Expanded(
                    flex: 8,
                    child: Image.asset('assets/images/logo.png',
                        alignment: Alignment.centerLeft),
                  ),
                ],
              ),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/background-tree.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  key: _formKey,
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Align items to the start
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36.0,
                          color: Color(0xFF375735),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      InputField(
                        label: 'First Name',
                        placeholder: 'Your Firstname',
                        controller: _firstnameController,
                      ),
                      const SizedBox(height: 15.0),
                      InputField(
                        label: 'Last Name',
                        placeholder: 'Your Lastname',
                        controller: _lastnameController,
                      ),
                      const SizedBox(height: 15.0),
                      InputField(
                        label: 'Email',
                        placeholder: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 15.0),
                      InputField(
                        label: 'Password',
                        placeholder: 'Password',
                        controller: _passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15.0),
                      InputField(
                        label: 'Confirm Password',
                        placeholder: 'Confirm Password',
                        controller: _cfpasswordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15.0),
                      ElevatedButton(
                        onPressed: _register, // เรียกใช้งานฟังก์ชัน _register
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFF375735),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 100.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        child: const Text(
                          'Register',
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
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 2.0,
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(10.0, 2.0, 2.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF375735),
              fontSize: 12.0, // Decrease the font size
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 45.0, // Decrease the height of the text field
            child: TextField(
              keyboardType: keyboardType,
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: placeholder,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
