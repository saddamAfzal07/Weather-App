import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class worker {
  String? location;
  String? temp;
  String? humidity;
  String? airspeed;
  String? description;
  String? main;
  String? icon;
  //Constructor

  worker({this.location}) {
    location = this.location;
  }

  Future<void> getdata() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2dba79d2ea3efcd5c47300a3c61edfaa"));

      Map data = jsonDecode(response.body);
      // print(data);
      // Getting Humidity;
      Map tem_data = data["main"];
      int getHumidity = tem_data["humidity"];
      double getTemp = tem_data["temp"] - 273.5;

      //Getting Air Speed
      Map wind = data["wind"];
      //speed in km/hour
      double getair_speed = wind["speed"] / 0.27777777777778;

      // Getting Description
      List weather_data = data["weather"];
      Map weather_main_data = weather_data[0];
      String get_main_des = weather_main_data["main"];
      String get_des = weather_main_data["description"];

      //Assinging Values
      temp = getTemp.toString();
      humidity = getHumidity.toString();
      airspeed = getair_speed.toString();
      description = get_des;
      main = get_main_des;
      icon = weather_main_data["icon"].toString();
    } catch (e) {
      temp = "Not Available";
      humidity = "Missing";
      airspeed = "Missing";
      description = "Data is Missing";
      main = "Missing";
      icon = "50d";
    }
  }
}
