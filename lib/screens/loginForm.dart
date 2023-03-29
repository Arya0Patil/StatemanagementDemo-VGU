import 'package:flutter/material.dart';
import 'package:state_management_demo/screens/displayUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _movieNameController = TextEditingController();
  TextEditingController _actorNameController = TextEditingController();
  TextEditingController _genreControler = TextEditingController();
  String movieName = "";
  String actorName = "";
  String genre = "";
  bool isVisible = false;

  void _setData() {
    setState(() {
      movieName = _movieNameController.text.toString();
      actorName = _actorNameController.text.toString();
      genre = _genreControler.text.toString();
    });
    FirebaseFirestore.instance
        .collection("Movies")
        .add({"name": movieName, "actor": actorName, "genre": genre});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Film Name"),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _movieNameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Enter Film name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Text(" Actor Name"),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _actorNameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Enter Actor Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Text("Genre"),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _genreControler,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        suffix: InkWell(
                            onTap: () {
                              setState(() {
                                // if (isVisible) {
                                //   isVisible = false;
                                //   passData();
                                // } else {
                                //   isVisible = true;
                                // }
                                isVisible = !isVisible;
                              });
                            },
                            child: isVisible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                        hintText: ""),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                      _setData();
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ShowUser(
                              email: movieName,
                              pass: actorName,
                            ),
                          ));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          )),
    );
  }
}
