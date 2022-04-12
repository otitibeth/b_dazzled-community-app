import 'dart:ui';

import 'package:flutter/material.dart';
import './login_screen.dart';
import './registration_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  Widget buildTextButton(String text, Function() onPressed) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            colors: [Colors.amberAccent, Colors.yellow, Colors.deepOrange]),
      ),
      child: TextButton(onPressed: onPressed, child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/happy.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                child: Center(
                  child: Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'B_dazled',
                          style: TextStyle(
                              fontFamily: 'Charm',
                              fontSize: 70,
                              fontWeight: FontWeight.w900,
                              color: Colors.deepOrange),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Make Your Mark!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'We are an online community.',
                          softWrap: true,
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Get Started!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                          softWrap: true,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 70, horizontal: 20),
                            child: SizedBox(
                              // width: MediaQuery.of(context).size.width * 1,
                              child: Row(
                                children: [
                                  buildTextButton(
                                    'Signup',
                                    () => Navigator.of(context)
                                        .pushNamed(RegisterScreen.routeName),
                                  ),
                                  const SizedBox(width: 25),
                                  buildTextButton(
                                    'Login',
                                    () => Navigator.of(context)
                                        .pushNamed(LoginScreen.routeName),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
