import 'package:flutter/material.dart';
import 'package:state_management_demo/screens/displayUser.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String email = "";
  String password = "";
  bool isVisible = false;

  void _setData() {
    setState(() {
      email = _emailController.text.toString();
      password = _passwordController.text.toString();
    });
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
                Text("Username"),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Enter Your username"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Text("Password"),
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: _passwordController,
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
                        hintText: "Enter Your Password"),
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
                              email: email,
                              pass: password,
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
