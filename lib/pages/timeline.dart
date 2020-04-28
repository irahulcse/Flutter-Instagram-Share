import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

// final userRef = Firestore.instance.collection('users');
final userRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    // TODO: implement initState
    getUsers();
    //getUserById();
    super.initState();
  }

  getUsers() async {
    //using the compound queries
    final QuerySnapshot snapshot = await userRef
        .limit(
          2,
        )
        .getDocuments();
    snapshot.documents.forEach((DocumentSnapshot doc) {
      print(doc.data);
      print(doc.documentID);
      print(doc.exists);
    });
  }

  // getUsers() async {
  //   //using the compound queries
  //   final QuerySnapshot snapshot = await userRef
  //       .orderBy(
  //         "postsCount",
  //         descending: false,
  //       )
  //       .getDocuments();
  //   snapshot.documents.forEach((DocumentSnapshot doc) {
  //     print(doc.data);
  //     print(doc.documentID);
  //     print(doc.exists);
  //   });
  // }

  // getUsers() async {
  //   //using the compound queries
  //   final QuerySnapshot snapshot = await userRef
  //       .where(
  //         "isAdmin",
  //         isEqualTo: false,
  //       )
  //       .where(
  //         "postsCount",
  //         isLessThan: 3,
  //       )
  //       .getDocuments();
  //   snapshot.documents.forEach((DocumentSnapshot doc) {
  //     print(doc.data);
  //     print(doc.documentID);
  //     print(doc.exists);
  //   });
  // }

  // getUsers() {
  //   userRef.getDocuments().then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach((DocumentSnapshot doc) {
  //       print(doc.data);
  //       print(doc.documentID);
  //       print(doc.exists);
  //     });
  //   });
  // }
  // getUserById() async {
  //   final String id="NI7urrMLiEGo8DRFRiNq ";
  //   final DocumentSnapshot doc = await userRef.document(id).get();
  //   print(doc.data);
  //   print(doc.documentID);
  //   print(doc.exists);
  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: linearProgress(),
    );
  }
}
