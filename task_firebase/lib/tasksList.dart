import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_firebase/loader.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    var task = FirebaseFirestore.instance.collection("Tasks");
    return StreamBuilder(
        stream: task.snapshots(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(),
            body: (snapshot.connectionState ==ConnectionState.active)
                ? ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) =>  Container(
                            margin: EdgeInsets.all(10),
                            padding:EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: ListTile(
                            title: Text(snapshot.data?.docs[index]["Title"],style:
                            TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                            
                            
                          )
                          )
                       )
                : LoaderWidget(
                    color: Colors.black,
                  ),
          );
        });
  }
}
