import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';

import 'Home_Page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: weatherApp(),
    ),
  );
}

class weatherApp extends StatelessWidget {
  const weatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch:
              Provider.of<WeatherProvider>(context).weatherData == null
                  ? Colors.blue
                  : Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor(),
        ),
        home: HomePage(),
      ),
    );
  }
}
