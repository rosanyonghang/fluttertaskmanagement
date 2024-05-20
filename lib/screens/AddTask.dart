import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaskmanagement/model/TaskModel.dart';
import 'package:uuid/uuid.dart';

class Addtask extends StatefulWidget {
  // the variables below are inherited from the parent
  // even widgets and functions can be passed as properties
  Function addTask;
  TaskModel task;

  Addtask({super.key, required this.addTask, TaskModel? task})
      : task = task ?? TaskModel(id: '-1', title: '', description: '');

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void initState() {
    if (widget.task.id == '-1') {
      print('add mode');
    } else {
      setState(() {
        title.text = widget.task.title;
        description.text = widget.task.title;
      });
      print('edit mode');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Task'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height - 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    TextField(
                      controller: title,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), label: Text('Title')),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: TextField(
                        controller: description,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Description')),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              var uuid = Uuid();
                              // the state acccesses its parent variables with widget object
                              widget.addTask(TaskModel(
                                  id: widget.task.id == '-1'
                                      ? uuid.v4()
                                      : widget.task.id,
                                  title: title.text,
                                  description: description.text));
                              Navigator.of(context).pop();
                            },
                            child: Text('Save'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
