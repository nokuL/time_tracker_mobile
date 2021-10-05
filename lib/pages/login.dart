import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/employee.dart';
import 'package:food_ordering_app/pages/month_list.dart';
import 'package:food_ordering_app/pages/sign_up_page.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> onLoginFailed(BuildContext context) async {
    showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Invalid username and password "),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  Future<void> login(Employee? employee) async {
    final response = await post(
      Uri.parse('http://10.0.2.2:8080/employees/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(employee),
    );
    if (response.body != null) {
      print("@@@@@@" + response.body);
      Navigator.push(
          context, MaterialPageRoute<void>(builder: (context) => MOnthLIst()));
    } else {
      Navigator.push(
          context, MaterialPageRoute<void>(builder: (context) => MOnthLIst()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Time Tracker",
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.teal,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.teal,
                      child: Text('Login'),
                      onPressed: () async {
                        Employee employee = Employee.newInstance();
                        login(employee);

                        print(nameController.text);
                        print(passwordController.text);

                        /*final user = {
                          UserFields.id: 1,
                          UserFields.name: "Nokuthaba",
                          UserFields.email: "lunganokuthaba@gmail.com",
                          UserFields.isBeginner: true
                        };*/
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange, // This is what you need!
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => SignUp()));
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
