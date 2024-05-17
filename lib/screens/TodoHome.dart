import 'package:flutter/material.dart';
import 'package:fluttertaskmanagement/screens/AddTask.dart';

import '../model/TaskModel.dart';

// Stateful widgets can rerender the screen when the data is reloaded
class Todohome extends StatefulWidget {
  @override
  State<Todohome> createState() => _TodohomeState();
}

class _TodohomeState extends State<Todohome> {
  String title = "Hello";

  List<TaskModel> tasks = [
    TaskModel(id: 1, title: "Task 1", description: "Task 1 description"),
    TaskModel(id: 2, title: "Task 2", description: "Task 2 description"),
    TaskModel(id: 3, title: "Task 3", description: "Task 3 description"),
    TaskModel(id: 4, title: "Task 4", description: "Task 4 description"),
    TaskModel(id: 5, title: "Task 5", description: "Task 5 description"),
  ];

  // a void function to add new elements to the taskmodel
  void addTask(TaskModel task){
    setState(() {
      tasks.add(task);
    });
  }

  void deleteTask(num id){
    // since this bottom sheet is a part of the list item,
    // it also holds the data of the list item being rendered
    print(id);
    // for(var i; i< tasks.length; i++){
    //   if(tasks[i].id != 1){
    //     tempTask.add(tasks[i]);
    //   }
    // }
    // this function filters the id being pushed
    // we are creating a new array where the data being passed
    // does not exist on the basis of id
    List<TaskModel> tempTask = tasks.where((task)=> task.id != el.id ).toList();

    // the new array replaces the old array of tasks
    setState(() {
      tasks = tempTask;
    });
    // it takes the navigation a step back
    Navigator.of(context).pop();
  }

  num count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:   Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            // we render the tasks here
            children: tasks.map((el) {
              return Container(
                margin: EdgeInsets.only(bottom: 12, top: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            el.title,
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(el.description),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        // Icon button is used to have a button with only icon and no texts
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              // showModalBottomSheet is like a dialog box that appears from
                              // the bottom of our screen
                              // it holds or displays any widgets that we add
                              showModalBottomSheet<void>(context: context, builder: (BuildContext context)=>Container(
                                child: Container(
                                  padding: EdgeInsets.all(24),
                                  width: double.infinity,
                                  height:200,
                                  child: Column(
                                    children: [
                                      Text('Are you sure you want to delete this?'),
                                      Container(
                                        margin: EdgeInsets.only(top:24),
                                        height:48,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            foregroundColor: Colors.white,
                                          ),
                                          onPressed: (){
                                            deleteTask(el.id);
                                          },
                                          child: Text('Confirm'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                            }, icon: Icon(Icons.delete)),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
                // we are passing the addTask method in the form of function property to AddTask widget
                Addtask(addTask: addTask, newIndex: tasks.length)));
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
