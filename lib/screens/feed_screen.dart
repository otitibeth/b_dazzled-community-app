import 'package:b_dazzled/models/models.dart';
import 'package:b_dazzled/providers.dart/data.dart';
import '../widgets/post_container.dart';
import 'package:flutter/material.dart';

class Feedscreen extends StatefulWidget {
  const Feedscreen({Key? key}) : super(key: key);

  @override
  State<Feedscreen> createState() => _FeedscreenState();
}

class _FeedscreenState extends State<Feedscreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Post post = posts[index];
        return PostContainer(post: post);
      },
      itemCount: posts.length,
    );
  }
}
