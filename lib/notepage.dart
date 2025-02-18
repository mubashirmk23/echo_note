import 'package:flutter/material.dart';
import 'package:flutter_echonotes_/addnewlist.dart';
import 'package:flutter_echonotes_/addnewtask.dart';
import 'package:flutter_echonotes_/addtextExample.dart';
import 'package:flutter_echonotes_/echnotepage1example.dart';
import 'package:flutter_echonotes_/echonotepage2exampl.dart';
import 'package:flutter_echonotes_/echontepage3.dart';

class Notepage extends StatefulWidget {
  @override
  State<Notepage> createState() => _notpage();
}

class _notpage extends State<Notepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Echo note',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.lightGreen,
          bottom: const TabBar(
              tabs: [
                Tab(text: 'Text'),
                Tab(text: 'List'),
                Tab(
                  text: 'Task',
                ),
              ],
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                EchnotepageExample1(),
                Echnotepage3Example(),
                Echonotepage2exampl(),
              ],
            )
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.lightGreen,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Addnewtask()));
              },
              child: Icon(Icons.check_circle),
              mini: true,
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              backgroundColor: Colors.lightGreen,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddnewlistExample()));
              },
              child: Icon(Icons.check_box),
              mini: true,
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              backgroundColor: Colors.lightGreen,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Addtextexample()));
              },
              child: Icon(Icons.menu),
            ),
          ],
        ),
      ),
    );
  }
}
