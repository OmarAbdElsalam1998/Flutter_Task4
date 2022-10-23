
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_firebase/loader.dart';
import 'package:task_firebase/homeScreen.dart';
import 'package:task_firebase/addTask.dart';
import 'package:task_firebase/tasksList.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomeScreen();
          } else
            return LoaderWidget(
              color: Colors.white,
            );
        },
      ),
       routes: {
         "/list":(context)=>const TasksList (),
        "/add":(context)=>const AddTask(),
        // "/edit":(context) => const EditTask()
      },
    );
  }
}
