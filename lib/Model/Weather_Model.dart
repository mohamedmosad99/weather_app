import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  DateTime date;
  double minTemp;
  double maxTemp;
  double temp;

  WeatherModel({
    required this.weatherStateName,
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
  });


  factory WeatherModel.fromjson(Map<String, dynamic> data){
    return WeatherModel(
      weatherStateName: data['weather_state_name'],
      date:DateTime.parse(data ['created']) ,
      minTemp: data ['min_temp'],
      maxTemp: data ['max_temp'],
      temp: data ['the_temp'],
    );
  }

  String getImage() {
    if
    (weatherStateName == 'Clear' || weatherStateName == 'Light Cloudy') {
      return 'assets/images/clear.png';
    }
    else if
    (weatherStateName == 'Sleet' || weatherStateName == 'Snow'
        || weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    }
    else if
    (weatherStateName == 'Light Rain' || weatherStateName == 'Heavy Rain'
        || weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    }
    else if
    (weatherStateName == 'Thunderstorm' || weatherStateName == 'Sleet') {
      return 'assets/images/thunderstorm.png';
    }

    else {
      return 'assets/images/clear.png';
    }
  }
  MaterialColor getThemeColor(){
    if
    (weatherStateName=='Clear' ||weatherStateName=='Light Cloudy' ){
      return Colors.orange;
    }
    else if
    (weatherStateName=='Sleet' ||weatherStateName=='Snow'
        ||weatherStateName=='Hail' ){
      return Colors.blue;
    }
    else if
    (weatherStateName=='Light Rain' ||weatherStateName=='Heavy Rain'
        ||weatherStateName=='Showers' ){
      return Colors.blueGrey;
    }
    else if
    (weatherStateName=='Thunderstorm' ||weatherStateName=='Sleet' ){
      return Colors.blue;
    }

    else {
      return Colors.green;
    }
  }
  }



