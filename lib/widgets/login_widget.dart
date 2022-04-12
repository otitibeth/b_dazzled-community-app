import 'package:b_dazzled/bloc/auth_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/forgot_password_screen.dart';
import '../screens/registration_screen.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // final _emailFocusNode = FocusNode();
  // final _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _form = GlobalKey();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget buildText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.deepOrangeAccent,
              letterSpacing: -1),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: ListView(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                buildText('WELCOME BACK'),
                const SizedBox(height: 15),
                const Text(
                  'LOgIfY',
                  style: TextStyle(
                      fontFamily: 'Charm',
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.deepOrange),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text('LOGIN!',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent)),
                ]),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text('Email Address'),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return value != null && !EmailValidator.validate(value)
                        ? 'Enter a valid email'
                        : null;
                  },
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility)),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return value != null && value.length < 6
                        ? "Enter min. 6 characters"
                        : null;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                            ForgotPasswordScreen.routeName);
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: const LinearGradient(colors: [
                      Colors.amberAccent,
                      Colors.yellow,
                      Colors.deepOrange
                    ]),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      _authenticateWithEmailAndPassword(context);
                    },
                    child: const Text(
                      'LOGIN',
                      // style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('or'),
                IconButton(
                  onPressed: () {
                    _authenticateWithGoogle(context);
                  },
                  icon: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png",
                    height: 30,
                    width: 30,
                  ),
                ),
                // const SizedBox(
                //   height: 15,
                // ),
                // MaterialButton(
                //   onPressed: () {},
                //   child: const Icon(
                //     Icons.fingerprint,
                //     size: 60,
                //     color: Colors.deepOrange,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                const Divider(height: 30, color: Colors.black87),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New Here?',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: const Text('Sign Up '),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_form.currentState!.validate()) {
      // If email is valid adding new Event [SignInRequested].
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

//
  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
