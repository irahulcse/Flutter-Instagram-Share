import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/home.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

class ActivityFeed extends StatefulWidget {
  @override
  _ActivityFeedState createState() => _ActivityFeedState();
}

class _ActivityFeedState extends State<ActivityFeed> {
  getActivityFeed() async {
    QuerySnapshot snapshot = await activityFeedRef
        .document(currentUser.id)
        .collection("feedItems")
        .orderBy('timestamp', descending: true)
        .limit(50)
        .getDocuments();

    snapshot.documents.forEach((doc) {
      print('Activity Feed Item:${doc.data}');
    });
    return snapshot.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(
        context,
        titleText: "Activity Feed",
      ),
      body: Container(
        child: FutureBuilder(
          future: getActivityFeed(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return circularProgress();
            }
            return Text("Activity Feed");
          },
        ),
      ),
    );
  }
}

class ActivityFeedItem extends StatelessWidget {
  final String username;
  final String userId;
  final String type; //like // follow //comment
  final String mediaUrl;
  final String postId;
  final String userProfileImg;
  final String commentData;
  final Timestamp timestamp;

  ActivityFeedItem({
    this.username,this.userId,this.type,this.mediaUrl,this.postId,this.userProfileImg,this.commentData,this.timestamp,
  })
factory ActivityFeedItem{

}

  @override
  Widget build(BuildContext context) {
    return Text('Activity Feed Item');
  }
}