import 'package:meta/meta.dart';

class User {
  final String name;
  final String imageUrl;
  String bio;

  User({required this.name, required this.imageUrl, this.bio = ''});
}
