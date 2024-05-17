import 'package:flutter/material.dart';

// Stateful widgets can rerender the screen when the data is reloaded
class Todohome extends StatefulWidget {
  @override
  State<Todohome> createState() => _TodohomeState();
}

class _TodohomeState extends State<Todohome> {
  String title = "Hello";

  num count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
          child: Text(
            count.toString(),
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          // we need to use setState, an inbuilt method to change the variable
          // changing it directly will not rerender the screen
          setState(() {
            // title = "something new";
            count++;
          });
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(
          //       title,
          //       style: TextStyle(fontSize: 32),
          //     ),
          //   ),
          // );
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
