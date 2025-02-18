import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echonotes_/databaseservice.dart';
import 'package:flutter_echonotes_/echnotepage1example.dart';
import 'package:flutter_echonotes_/echonotepage2exampl.dart';
import 'package:random_string/random_string.dart';

class Addnewtask extends StatefulWidget {
  @override
  State<Addnewtask> createState() => _AddnewtaskState();
}

class _AddnewtaskState extends State<Addnewtask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  final DateTime datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final date = "${datetime.day}-${datetime.month}-${datetime.year}";
    final time = "${datetime.hour}:${datetime.minute}";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new Task',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Spacer(),
          GestureDetector(
            onTap: () async {
              String id = randomAlphaNumeric(10);
              Map<String, dynamic> noteInfoMap = {
                "title": titleController.text,
                "Description": DescriptionController.text,
                "date": date,
                "time": time,
                "id": id,
              };
              setState(() {
                titleController.clear();
                DescriptionController.clear();
                Navigator.pop(context);
              });
              await DataBase.addTask(noteInfoMap, id);
            },
            child: Icon(
              Icons.check,
            ),
          ),
        ],
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text('title')),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: DescriptionController,
              maxLines: 20,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text('Description')),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "${datetime.day.toString()}-${datetime.month.toString()}-${datetime.year.toString()}",
                  style: TextStyle(color: Colors.lightGreen),
                ),
                Spacer(),
                Text(
                  "${datetime.hour.toString()}:${datetime.minute.toString()}:${datetime.second.toString()}",
                  style: TextStyle(color: Colors.green),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
