import 'package:b_dazzled/bloc/auth_bloc.dart';
import 'package:b_dazzled/screens/home_screen.dart';
import 'package:b_dazzled/widgets/login_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
        if (state is Authenticated) {
          // Navigating to the dashboard screen if the user is authenticated
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
        if (state is AuthError) {
          // Showing the error message if the user has entered invalid credentials
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is Loading) {
          // Showing the loading indicator while the user is signing in
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UnAuthenticated) {
          // showing the sign in form if the user is not authenticated
          return const LoginWidget();
        }
        return Container();
      })),
    );
  }
}
