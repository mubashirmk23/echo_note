import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echonotes_/databaseservice.dart';


class EchnotepageExample1 extends StatefulWidget {
  const EchnotepageExample1({super.key});

  @override
  State<EchnotepageExample1> createState() => _Echnotepage1State();
}

class _Echnotepage1State extends State<EchnotepageExample1> {
  Stream<QuerySnapshot>? textStream;

  getontheload() async {
    textStream = await DataBase.getTextDetails();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Widget allTextDetails() {
    return StreamBuilder(
        stream: textStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("An Error has occured ${snapshot.error}");
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("Data is not available"));
          }
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 2),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot Ds = snapshot.data!.docs[index];
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                          border: Border.all(width: 0.8, color: Colors.white)),
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "" + (Ds["title"] ?? "N/A"),
                                style: TextStyle(
                                    fontSize: 24,
                                    color: const Color.fromARGB(
                                        255, 251, 187, 187),
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "" + (Ds["contents"] ?? "N/A"),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Spacer(),
                                  Icon(Icons.edit, color: Colors.white),
                                  GestureDetector(
                                      onTap: () async {
                                        Navigator.pop(context);
                                        await DataBase.deleteTextDetails(
                                            Ds["id"]);
                                      },
                                      child: Icon(Icons.delete,
                                          color: Colors.white)),
                                ],
                              ),
                            ],
                          )),
                    );
                  }));
        });
  }

  void clearAllNotes() async {
    var collection = FirebaseFirestore.instance.collection('Text');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:allTextDetails(),
    
    );
  }
}
