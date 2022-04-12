import 'dart:ui';

import 'package:b_dazzled/providers.dart/data.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeader(
                  post: post,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(post.caption),
                post.imageUrl != ''
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 12,
                      )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: post.imageUrl != ''
                ? Image.network(post.imageUrl)
                : const SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Poststats(post: post),
          )
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(post.user.imageUrl),
            backgroundColor: Colors.grey.shade200,
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.user.name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '${post.timeAgo} .',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    Icon(
                      Icons.public,
                      color: Colors.grey[600],
                      size: 12,
                    )
                  ],
                )
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}

class Poststats extends StatelessWidget {
  const Poststats({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 14,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '${post.comment} comments',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                  child: buildPostButton(
                      Icons.thumb_up_alt_outlined, 'Like', () {})),
              Expanded(child: buildPostButton(Icons.comment, 'Comment', () {})),
              buildPostButton(Icons.ios_share_outlined, 'Share', () {}),
            ],
          ),
        ),
      ],
    );
  }
}

Widget buildPostButton(IconData icon, String label, VoidCallback onTap) {
  return Material(
    color: Colors.white,
    child: InkWell(
      onTap: onTap,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 4),
          Text(label),
        ],
      ),
    ),
  );
}
