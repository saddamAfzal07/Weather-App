import 'package:flutter/material.dart';

import 'package:weather_app/workers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Screens/Home.dart';

class loading extends StatefulWidget {
  const loading({
    Key? key,
  }) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String? temprature;
  String? humidity_temp;
  String? Airspeed;
  String? Description;
  String? Main;
  String? icon;
  String? cityname = "Murree";

  startapp() async {
    worker instanceobj = worker(location: cityname);
    await instanceobj.getdata();
    Future.delayed(Duration(seconds: 3), () {
      temprature = instanceobj.temp;
      humidity_temp = instanceobj.humidity;
      Airspeed = instanceobj.airspeed;
      Description = instanceobj.description;
      Main = instanceobj.main;
      icon = instanceobj.icon;
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temp_value": temprature,
        "hum_value": humidity_temp,
        "air_speed_value": Airspeed,
        "des_value": Description,
        "Main_value": Main,
        "icon_value": icon,
        "city_value": cityname,
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print("Present the weather");
    startapp();
  }

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)!.settings.arguments as Map;
    String show = args["Search"];
    print(show);

    if (show.isNotEmpty) {
      cityname = show;
      startapp();
    }

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/mlogo.png",
              height: 240,
              width: 240,
            ),
            Text(
              "Mousam ForeCast",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Climate Awarness ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
