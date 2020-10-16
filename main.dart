import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course application"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Dept").snapshots(),
        builder: (context, snapshot){
           return ListView.builder(
             itemCount: snapshot.data.documents.length,
             itemBuilder: (context, index){
                DocumentSnapshot Dept = snapshot.data.documents[index];
                return ListTile(
                   title: Text(Dept['name']),
                   subtitle: Text(Dept['labs']),
                );
             },
             );
        },
      ),
    );
  }
}