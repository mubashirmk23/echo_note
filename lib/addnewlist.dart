import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echonotes_/databaseservice.dart';
import 'package:flutter_echonotes_/echnotepage1example.dart';
import 'package:flutter_echonotes_/echontepage3.dart';
import 'package:random_string/random_string.dart';

class AddnewlistExample extends StatefulWidget {
  @override
  State<AddnewlistExample> createState() => _AddnewlistExample();
}

class _AddnewlistExample extends State<AddnewlistExample> {
  TextEditingController titleController = TextEditingController();
  TextEditingController Addtolistcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () async {
                String id = randomAlphaNumeric(10);
                Map<String, dynamic> echonotesInfoMap = {
                  "title": titleController.text,
                  "Addtolist": Addtolistcontroller.text,
                  "id": id,
                };

                setState(() {
                  titleController.clear();
                  Addtolistcontroller.clear();
                  Navigator.pop(context);
                });
                await DataBase.addList(echonotesInfoMap, id);
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Echnotepage3Example()));
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
            
              controller: Addtolistcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Addtolist',
                prefixIcon: Icon(Icons.add,color: Colors.lightGreen,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
