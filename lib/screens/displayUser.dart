import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:state_management_demo/screens/movieEditForm.dart';

class ShowUser extends StatelessWidget {
  final String? email;
  final String? pass;
  const ShowUser({super.key, this.email, this.pass});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Data")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Movies')
            // .where("genre", isEqualTo: "drama")
            // .orderBy("name")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final data = documents[index].data() as Map<String, dynamic>;
              final title = data['name'] ?? '';
              final subtitle = data['actor'] ?? '';
              final genre = data['genre'] ?? "";
              return ListTile(
                title: Text(title),
                subtitle: Text("${subtitle} ${genre}"),
                trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => EditForm(
                            aName: subtitle,
                            mName: title,
                            genre: genre,
                            documentId: documents[index].id,
                          ),
                        ),
                      );
                    },
                    child: Text("Edit")),
                leading: IconButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('Movies')
                          .doc(documents[index].id)
                          .delete();
                    },
                    icon: Icon(Icons.remove)),
              );
            },
          );
        },
      ),
    );
  }
}
