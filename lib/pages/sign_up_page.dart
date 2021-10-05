import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/employee.dart';
import 'package:food_ordering_app/pages/month_list.dart';
import 'package:food_ordering_app/services/employee_service.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController employeeTitleController = TextEditingController();
  TextEditingController employeeNumberController = TextEditingController();
  EmployeeService employeeService = EmployeeService();
  int? _isAdmin = 0;

  Future<void> onLoginFailed(BuildContext context) async {
    showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Failed to creat account "),
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

  Future<void> saveDetails(BuildContext context, Employee employee) async {
    final response = await post(
      Uri.parse('http://10.0.2.2:8080//employees/addEmployee'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(employee),
    );
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute<void>(builder: (context) => MOnthLIst()));
    } else {
      onLoginFailed(context);
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
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: employeeNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ' Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: employeeTitleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: employeeNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Employee Number',
                    ),
                  ),
                ),
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
                      child: Text('Submit'),
                      onPressed: () async {
                        Employee employee = Employee(
                            null,
                            employeeNumberController.text,
                            employeeNameController.text,
                            employeeTitleController.text,
                            passwordController.text,
                            nameController.text,
                            "");

                        await saveDetails(context, employee);
                      },
                    )),
              ],
            )));
  }
}
