import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String description;
  final String location;
  final String mediaUrl;
  final String timestamp;
  final String username;
  final dynamic likes;

  Post({
    this.postId,
    this.ownerId,
    this.description,
    this.location,
    this.mediaUrl,
    this.likes,
    this.username,
    this.timestamp,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      postId: doc['postId'],
      ownerId: doc['ownerId'],
      username: doc['username'],
      description: doc['description'],
      mediaUrl: doc['mediaUrl'],
      likes: doc['likes'],
    );
  }

  int getLikeCount() {
    //if no likes return 0

    if (likes == null) {
      return 0;
    }

    int count = 0;
    //if the key is explicitly set to true, add a like
    likes.values.forEach((val) {
      if (val == true) {
        count += 1;
      }
    });

    return count;
  }

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Text("Post");
  }
}
