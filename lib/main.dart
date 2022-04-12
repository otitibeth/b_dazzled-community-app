import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:b_dazzled/bloc/auth_bloc.dart';
import 'package:b_dazzled/models/models.dart';
import 'package:b_dazzled/repositories/auth_repository.dart';
import 'package:b_dazzled/screens/add_post_screen.dart';
import 'package:b_dazzled/screens/logout_screen.dart';
import 'package:b_dazzled/screens/profile_screen.dart';
import './screens/home_screen.dart';
import './screens/landing_screen.dart';
import './screens/forgot_password_screen.dart';
import './screens/registration_screen.dart';
import './screens/login_screen.dart';
import './models/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          // navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'LOgify',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: StreamBuilder<u.User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // if the snapshothas user data, then they're already signed in.so Navigate to home screen
              return snapshot.hasData
                  ? const HomeScreen()
                  : const RegisterScreen();
            },
          ),

          routes: {
            LoginScreen.routeName: (ctx) => const LoginScreen(),
            RegisterScreen.routeName: (ctx) => const RegisterScreen(),
            ForgotPasswordScreen.routeName: (ctx) =>
                const ForgotPasswordScreen(),
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            AddPostScreen.routeName: (ctx) => const AddPostScreen(),
            ProfileScreen.routeName: (ctx) => const ProfileScreen(),
            LogoutScreen.routename: (ctx) => const LogoutScreen(),
          },
        ),
      ),
    );
  }
}
