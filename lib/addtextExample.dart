import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echonotes_/databaseservice.dart';
import 'package:flutter_echonotes_/echnotepage1example.dart';
import 'package:random_string/random_string.dart';

class Addtextexample extends StatefulWidget {
  @override
  State<Addtextexample> createState() => _AddtextState();
}

class _AddtextState extends State<Addtextexample> {
  TextEditingController titleController = TextEditingController();
  TextEditingController ContentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Text',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () async {
                String id = randomAlphaNumeric(10);
                Map<String, dynamic> echonoteInfoMap = {
                  "title": titleController.text,
                  "contents": ContentsController.text,
                  "id": id,
                };
                setState(() {
                  titleController.clear();
                  ContentsController.clear();
                  Navigator.pop(context);
                });
                await DataBase.addText(echonoteInfoMap, id);
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EchnotepageExample1()));
                },
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ContentsController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contents',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
