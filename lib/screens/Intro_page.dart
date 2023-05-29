import 'package:flutter/material.dart';
import 'Intro_page2.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => IntroPage2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        const Color(0xFF375735); // Set the desired green color here

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF375735),
          image: DecorationImage(
            image: AssetImage('assets/images/intro-background.png'),
            alignment: Alignment.bottomLeft,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset('assets/images/logo-intro.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Next Screen!'),
      ),
    );
  }
}
