import 'package:flutter/material.dart';
import 'package:plantforyou/components/button.component.dart';
import 'package:plantforyou/screens/homes_page.dart';
import 'package:plantforyou/screens/login_page.dart';
import 'package:plantforyou/screens/signin_page.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white; // Set the desired green color here

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/intro-bg.png'),
            alignment: Alignment.bottomLeft,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  // Add your child widgets here
                  Image.asset('assets/images/logo-intro2.png'),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 200, // Set a fixed width for the buttons
                    child: MyButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LoginPage(), // Navigate to LoginPage
                          ),
                        );
                      },
                      text: 'Login',
                      buttonColor: Colors.white,
                      foregroundColor: const Color(
                          0xFF375735), // Set the text color to black
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 200, // Set a fixed width for the buttons
                    child: MyButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SignInPage(), // Navigate to LoginPage
                          ),
                        );
                      },
                      text: 'Sign In',
                      buttonColor: Colors.white,
                      foregroundColor: const Color(
                          0xFF375735), // Set the text color to black
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 200, // Set a fixed width for the buttons
                    child: MyButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const HomesPage(), // Navigate to LoginPage
                          ),
                        );
                      },
                      text: 'Get Exploer',
                      buttonColor: Colors.green[600],
                      foregroundColor:
                          Colors.black, // Set the text color to black
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
