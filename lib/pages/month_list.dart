import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/submit_tracker_form.dart';
import 'package:food_ordering_app/pages/user_fields.dart';
import 'package:food_ordering_app/pages/user_tracker_details.dart';

class MOnthLIst extends StatefulWidget {
  MOnthLIst();

  @override
  _MOnthLIstState createState() => _MOnthLIstState();
}

class _MOnthLIstState extends State<MOnthLIst> {
  int counter = 0;
  var _loadingData = true;
  List<String> months = [
    'January',
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  TextEditingController quantityController = TextEditingController();
  UserTrackerDetails userTrackerdetails = UserTrackerDetails.newInstance();

  @override
  void initState() {
    super.initState();
    ;
    final user = {
      UserFields.january: userTrackerdetails.january,
      UserFields.february: userTrackerdetails.february,
      UserFields.march: userTrackerdetails.march,
      UserFields.april: userTrackerdetails.april,
      UserFields.may: userTrackerdetails.may,
      UserFields.june: userTrackerdetails.june,
      UserFields.july: userTrackerdetails.july,
      UserFields.august: userTrackerdetails.august,
      UserFields.september: userTrackerdetails.september,
      UserFields.october: userTrackerdetails.october,
      UserFields.november: userTrackerdetails.november,
      UserFields.december: userTrackerdetails.december
    };
    _loadData();
  }

  Future<void> _loadData() async {}

  void onTap(BuildContext context, String month) {
    showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Enter vaction days for $month "),
              actions: <Widget>[
                TextFormField(
                  // The validator receives the text that the user has entered.
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 2.0),
                    ),
                    labelText: 'Number of Vacation days',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter number of days';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    TextButton(
                      child: Text('save'),
                      onPressed: () async {
                        if (month == "January") {
                          userTrackerdetails.january = quantityController.text;
                          print(">>>>>> added January");
                        } else if (month == "February") {
                          userTrackerdetails.february = quantityController.text;
                          print(">>>>>> added feb");
                        } else if (month == "March") {
                          userTrackerdetails.march = quantityController.text;
                          print(">>>>>> added march");
                        } else if (month == "April") {
                          userTrackerdetails.april = quantityController.text;
                          print(">>>>>> added april");
                        } else if (month == "May") {
                          userTrackerdetails.may = quantityController.text;
                          print(">>>>>> added may");
                        } else if (month == "June") {
                          userTrackerdetails.june = quantityController.text;
                          print(">>>>>> added june");
                        } else if (month == "July") {
                          userTrackerdetails.july = quantityController.text;
                          print(">>>>>> added july");
                        } else if (month == "August") {
                          userTrackerdetails.august = quantityController.text;
                          print(">>>>>> added august");
                        } else if (month == "September") {
                          userTrackerdetails.september =
                              quantityController.text;
                          print(">>>>>> added september");
                        } else if (month == "October") {
                          userTrackerdetails.october = quantityController.text;
                          print(">>>>>> added october");
                        } else if (month == "November") {
                          userTrackerdetails.november = quantityController.text;
                          print(">>>>>> added november");
                        } else if (month == "December") {
                          userTrackerdetails.december = quantityController.text;
                          print(">>>>>> added december");
                        }

                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
              ],
            ));
  }

  void addedSuccessFully(BuildContext context) {
    showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Dish added to cart "),
              actions: <Widget>[
                Row(
                  children: [
                    Text('Dish added to cart'),
                    TextButton(
                      child: Text('ok'),
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute<void>(
                    builder: (context) =>
                        SubmitTrackerForm(userTrackerdetails)));
          },
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.remove_red_eye_outlined),
        ),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.beach_access), text: "Vacation Days"),
              Tab(icon: Icon(Icons.sick), text: "Sick Leave"),
            ],
          ),
          title: Text("Time Tracker"),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
                itemCount: months.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        onTap: () {
                          onTap(context, months[index]);
                        },
                        title: Text(months[index],
                            style: TextStyle(fontSize: 30.0)),
                        leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/book.jpeg')),
                        trailing: Visibility(
                          child: SizedBox(
                            width: 150,
                            child: ButtonBar(
                              children: [],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            Icon(Icons.directions_transit, size: 350),
          ],
        ),
      ),
    );
  }
}
