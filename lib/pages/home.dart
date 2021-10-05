/*
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ordering_app/models/topic.dart';
import 'package:food_ordering_app/services/worldtime.dart';

import 'admin_dish_list.dart';

class Home extends StatefulWidget {
  String? time;
  String? flag;
  String? location;

  Home({this.time, this.flag, this.location});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _loadingData = true;
  List<Topic> topics = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _loadData);
  }

  Future<void> _loadData() async {
    await getWorldTime();
    setState(() {
      _loadingData = false;
    });
  }

  Future<void> getWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Harare', flag: 'zimbabwe.png', url: 'Europe/Berlin');
    topics = await worldTime.getTopic();
    await worldTime.sendTopic();
    print("TOPICS FROM SERVER $topics");
    setState(() {
      widget.time = worldTime.time;
      widget.location = worldTime.location;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingData) {
      return Container(
        color: Colors.white,
        child: Center(
          child: SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 2,
        title: Text("Noxie's Deli"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.location ?? 'Failed to load location',
                style: TextStyle(fontSize: 28.0, letterSpacing: 1.0),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.time ?? 'Failed to load the time',
            style: TextStyle(fontSize: 66.0),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (context) => AdminDishLIst()));
              },
              child: Text('Choose Location'))
        ],
      )),
    );
  }
}
*/
