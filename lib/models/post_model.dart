import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'models.dart';

class Post extends Equatable {
  final User user;
  final String caption;
  final String timeAgo;
  // final String article;
  // final Location location;
  final String imageUrl;
  final int comment;
  final int likes;

  const Post({
    required this.user,
    required this.caption,
    required this.timeAgo,
    // required this.article,
    // required this.location,
    required this.likes,
    required this.imageUrl,
    required this.comment,
  });

  @override
  List<Object?> get props => [
        user,
        caption,
        imageUrl,
        likes,
        comment,
      ];
}
