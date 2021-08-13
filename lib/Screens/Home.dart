import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_app/Screens/Loading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController namecity = new TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    Map info =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    String temp = (((info["temp_value"]).toString()).substring(0, 4));
    String icon = info["icon_value"].toString();
    String city = info["city_value"];
    String des = info["des_value"];
    String humidity = info["hum_value"];
    String air = ((info["air_speed_value"]).toString()).substring(0, 4);
    // print(icon);
    //icons wala portion smjana ki zarorat hai bhaiya

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade200,
              Colors.blue,
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade800,
                  Colors.blue.shade300,
                ]),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0)),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/loading",
                                arguments: {
                                  "Search": namecity.text,
                                });
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextField(
                          controller: namecity,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Any City Name",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.network(
                          "http://openweathermap.org/img/wn/$icon@2x.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            "$des",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "In $city",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(25),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/heat.png",
                              width: 45,
                              height: 45,
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$temp",
                              style: TextStyle(fontSize: 70.0),
                            ),
                            // Text(
                            //   "C",
                            //   style: TextStyle(fontSize: 30.0),
                            // ),
                            Image.asset(
                              "assets/celsius.png",
                              width: 60,
                              height: 50,
                            )
                          ]),
                    ])),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 180,
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/wind.png",
                                width: 30,
                                height: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$air",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Km/hr",
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 180,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/humidity.png",
                                width: 30,
                                height: 30,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$humidity",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Percent",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Made By KK AppSol",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      Text("Data Provided by www.Openweathermap.org"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
