import 'package:flutter/material.dart';
import 'package:fluttertaskmanagement/model/TaskModel.dart';

class Addtask extends StatefulWidget {
  Function addTask;
  num newIndex;
  Addtask({required this.addTask, required this.newIndex});

  @override
  State<Addtask> createState() => _AddtaskState();
}



class _AddtaskState extends State<Addtask> {
  String title = '';
  String description = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Task'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          height: MediaQuery
              .of(context)
              .size
              .height - 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    TextField(
                      onChanged: (val) {
                        // this value changes variable when the input is changed
                        setState(() {
                          title = val;
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), label: Text('Title')),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            description = val;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Description')),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top:16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)
                              ),
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              widget.addTask(TaskModel(id: widget.newIndex, title: title, description: description));
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
