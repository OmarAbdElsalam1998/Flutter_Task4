import 'package:flutter/material.dart';
import 'package:task_firebase/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTask extends StatefulWidget {
  const AddTask({ Key? key }) : super(key: key);

  @override
  State createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  Task task=Task(Title:"",IsDone:false,CreatedDate:DateTime.now());
  var FormKey = GlobalKey<FormState>();
  saveTask() {
    FormKey.currentState?.save();
    FirebaseFirestore.instance
        .collection("Tasks")
        .add({
          "Title":task.Title,
          "IsDone":false,
          "CreatedDate":DateTime.now()
        });
       
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        actions: [
          IconButton(onPressed: (){
            FormKey.currentState!.reset();

          }, icon: Icon(Icons.replay))
        ],
      ),
      body:  Padding(
        padding: EdgeInsets.all(10),
      child:Form(
        key: FormKey,
        child: ListView(
          children: [
            SizedBox(height: 10,),
             TextFormField(

                validator: (value) {
                  if(value!.isEmpty){
                    return "required";
                  }
                  if(value.length<3){
                    return "must have at least 3 characters";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  setState(() {
                    task.Title=newValue!;
                  });
                },
                decoration: InputDecoration(

                  hintText: "Add Task",
                  labelText: "Task",
                  border: OutlineInputBorder(),
                ),
                
  
             ) ,
             ElevatedButton(onPressed:saveTask, child: const Text("Add Task")) 
          ],
        ),
        
      )
    ),
    );
  }
}