import 'package:b_dazzled/bloc/auth_bloc.dart';
import 'package:b_dazzled/providers.dart/data.dart';
import 'package:b_dazzled/screens/login_screen.dart';
import 'package:b_dazzled/screens/logout_screen.dart';
import 'package:b_dazzled/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer(
      {
      //required this.url,
      Key? key})
      : super(key: key);
  // final String url;

  Widget buildListTile(String title, IconData icon, Function() tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.deepOrange,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Getting the user from the Firebaseauth Instance
    final user = FirebaseAuth.instance.currentUser!;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          // Navigate to signin screen when the user sign out
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
          );
        }
      },
      child: Drawer(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Account Info',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Stack(
                    alignment: Alignment(2, 3),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: CircleAvatar(
                          radius: 33,
                          backgroundImage: NetworkImage(currentUser.imageUrl),
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_a_photo,
                          size: 15,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Text(
                    currentUser.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              'Email : ${user.email}',
              style: TextStyle(fontSize: 16),
            ),
          ),
          buildListTile(
            'Profile',
            Icons.person,
            () {
              // Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
            },
          ),
          buildListTile(
            'Settings',
            Icons.settings,
            () {
              // Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
            },
          ),
          buildListTile(
            'Log Out',
            Icons.arrow_back,
            () {
              context.read<AuthBloc>().add(SignOutRequested());
              print('signedout');
              // Navigator.of(context).pushNamed(Loginscreen.routeName);
              Navigator.of(context).pushNamed(LogoutScreen.routename);
              // Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
            },
          ),
        ]),
      ),
    );
  }
}
