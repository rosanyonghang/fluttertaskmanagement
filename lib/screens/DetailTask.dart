import 'package:flutter/material.dart';

class Detailtask extends StatelessWidget {
  const Detailtask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Title'),
            Text('Description'),
          ],
        ),
      ),
    );
  }
}
