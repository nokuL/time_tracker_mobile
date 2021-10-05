import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/user_tracker_details.dart';
import 'package:food_ordering_app/services/user_tracker_details_service.dart';

class SubmitTrackerForm extends StatefulWidget {
  const SubmitTrackerForm(this.userTrackerDetails);
  final UserTrackerDetails userTrackerDetails;

  @override
  SubmitTrackerFormState createState() {
    return SubmitTrackerFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SubmitTrackerFormState extends State<SubmitTrackerForm> {
  final _formKey = GlobalKey<FormState>();
  double orderTotal = 0.0;
  String? january;
  UserTrackerService userTrackerService = UserTrackerService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "Vacation days taken",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "January :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.january ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "February :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.february ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "March :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.march ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "April :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.april ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "May :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.may ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "June :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.june ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "July :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.july ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "August :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.august ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "September :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.september ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "October :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.october ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "November :   ",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.november ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Text(
                "December :",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.userTrackerDetails.december ?? "0",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.teal,
                child: Text('Submit '),
                onPressed: () async {
                  userTrackerService.saveDetails(widget.userTrackerDetails);
                },
              )),
        ],
      ),
    );
  }
}
