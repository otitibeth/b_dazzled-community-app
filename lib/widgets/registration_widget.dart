import 'package:b_dazzled/bloc/auth_bloc.dart';
import 'package:b_dazzled/models/user_model.dart' as u;
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/login_screen.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool _obscureText = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey();

  @override
  void dispose() {
    _nameController.dispose();
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
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.deepOrangeAccent,
              letterSpacing: -2),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Center(
            child: Column(
              children: [
                buildText('JOIN US!'),
                const SizedBox(height: 20),
                const Text(
                  'LOgIfY',
                  style: TextStyle(
                      fontFamily: 'Charm',
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.deepOrange),
                ),
                const SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
                  Text('SIGN UP!',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent)),
                ]),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      label: Text('Name'),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()),
                  textInputAction: TextInputAction.next,
                  controller: _nameController,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      label: Text('Email Adress'),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()),
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return value != null && !EmailValidator.validate(value)
                        ? 'Enter a valid email'
                        : null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
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
                  textInputAction: TextInputAction.done,
                  controller: _passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return value != null && value.length < 6
                        ? 'Enter min. 6 characters'
                        : null;
                  },
                ),
                const SizedBox(height: 15),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      _createAccountWithEmailAndPassword(context);
                    },
                    child: const Text('SIGN UP'),
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
                const SizedBox(height: 15),
                const Text("Or"),
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
                const Divider(height: 30, color: Colors.black87),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have An Account?',
                      style: TextStyle(color: Colors.black.withOpacity(0.7)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createAccountWithEmailAndPassword(BuildContext context) {
    if (_form.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(
          _emailController.text,
          _passwordController.text,
        ),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
