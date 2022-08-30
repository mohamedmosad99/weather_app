import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Model/Weather_Model.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/Services/Weather_Services.dart';

class searchpage extends StatelessWidget {

    String? cityName;

    searchpage ({this.updateUi});
    VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title:   Text('Search  a City'),
      ),
      body: Center(
        child: TextField(
          // use it as change from user .
         // onChanged: (Data){
          //  print('Data');
         // },
          // use it as submitted from user .
          onChanged:(Data){
            cityName=Data;
          } ,
          onSubmitted: (Data)
          async {
            cityName = Data ;
            WeatherService services=WeatherService();
              WeatherModel?  weather =await services.getWeather(cityName: cityName!);
              //  weatherData =weather;
            Provider.of<WeatherProvider>(context,listen: false) .cityName = cityName!;

           Provider.of<WeatherProvider>(context,listen: false) .weatherData = weather;
            updateUi!();
           Navigator.pop(context);
          },
          scrollPadding: const EdgeInsets.all(8),
          decoration: const InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 28, horizontal: 16),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              // use it as a world in the table.
              label: Text('Search',style: TextStyle(
                fontSize: 20,
              ),
              ),
              // prefixIcon: Icon(Icons.search),
              hintText: 'Enter a City'),
        ),
      ),
    );
  }
}



