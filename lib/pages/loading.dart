/*
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ordering_app/services/worldtime.dart';

import 'home.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String? time = 'Loading';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green,
            ),
          );
        },
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }

  void getWorldTime() async {
    WorldTime worldTime = WorldTime(
        location: 'Harare', flag: 'zimbabwe.png', url: 'Europe/Berlin');
    await worldTime.getTime();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
            builder: (context) => Home(
                  location: worldTime.location,
                  time: worldTime.time,
                  flag: worldTime.flag,
                )));
  }
}
*/
