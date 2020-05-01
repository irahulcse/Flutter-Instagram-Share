import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/pages/home.dart';
import 'package:fluttershare/widgets/progress.dart';

class EditProfile extends StatefulWidget {
  final String currentUserId;

  EditProfile({this.currentUserId};)
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isLoading= false;
  User user;
  TextEditingController displayNameController= TextEditingController();
  TextEditingController bioController= TextEditingController();           
  @override
  
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  getUser() async{ 
   setState(() {
     isLoading=true;
   });
    DocumentSnapshot doc= await usersRef.document(widget.currentUserId).get();
      user =User.fromDocument(doc);
    displayNameController.text= user.displayName;
    bioController.text=user.bio;
    setState(() {
     isLoading=false;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Editing Profile',
          style : TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          
          IconButton(icon: Icon(Icons.done, size: 30.0, color: Colors.green,), onPressed: ()=> Navigator.pop(context),),
        ],
      ),
      body: isLoading? circularProgress(): ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                pad
              ],
            ),
          )
        ],
      ),
    );
  }
}
