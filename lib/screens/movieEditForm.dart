import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {
  final String mName;
  final String aName;
  final String genre;
  final documentId;
  const EditForm(
      {super.key,
      required this.aName,
      required this.mName,
      required this.genre,
      required this.documentId});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  TextEditingController mName = TextEditingController();
  TextEditingController aName = TextEditingController();
  TextEditingController genre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Form"),
      ),
      body: Center(
        child: Form(
            child: Column(
          children: [
            Text("Movie Name"),
            Container(
              width: 200,
              child: TextFormField(
                initialValue: widget.mName,
                decoration: InputDecoration(hintText: "Movie Name"),
              ),
            ),
            Container(
              width: 200,
              child: TextFormField(
                initialValue: widget.aName,
                decoration: InputDecoration(hintText: "Actor Name"),
              ),
            ),
            Container(
              width: 200,
              child: TextFormField(
                initialValue: widget.genre,
                decoration: InputDecoration(hintText: "Genre"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('Movies')
                      .doc(widget.documentId)
                      .update({
                    'name': "Dangal3",
                    'actor': "amir",
                    'genre': "drama"
                  });
                },
                child: Text("Confirm"))
          ],
        )),
      ),
    );
  }
}
