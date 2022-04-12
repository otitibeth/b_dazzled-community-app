import 'package:flutter/material.dart';

import './login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgotPassword';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'FORGOT PASSWORD',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.deepOrangeAccent,
                          letterSpacing: -2),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                const Text(
                  'LOgIfY',
                  style: TextStyle(
                      fontFamily: 'Charm',
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.deepOrange),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      label: Text('Email Adress'),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email!';
                    }
                    if (!value.endsWith('@gmail.com') ||
                        !value.endsWith('@yahoo.com')) {
                      return 'Enter a registered email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text('Reset Password'),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(colors: [
                      Colors.amberAccent,
                      Colors.yellow,
                      Colors.deepOrange
                    ]),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    child: const Text('Back to Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
