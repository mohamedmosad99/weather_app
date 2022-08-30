import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Model/Weather_Model.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/Search_Page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.orangeAccent,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return searchpage(
                    updateUi: updateUi,
                  );
                }));
              },
              icon: Icon(Icons.search),
            )
          ],
          title: const Text('Weather'),
          //leading:  Icon(Icons.search),
        ),
        body: weatherData == null
            ?
            //Provider.of<WeatherProvider>(context).weatherData == null ?
            Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'there is no weather 😁 start',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Text(
                      'start searching now',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                  Colors.orange[50]!,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                //color: weatherData!.getThemeColor(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Provider.of<WeatherProvider>(context).cityName!,
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                       Text(
                           'Updated at ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                          style: TextStyle(
                            fontSize: 22,
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(weatherData!.getImage()),
                          Text(
                            //  weatherData!.temp.toInt().toString(),
                            '${weatherData!.temp.toInt()}',
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text('maxtemp : ${weatherData!.maxTemp.toInt()}'),
                              //   style: TextStyle(
                              //     fontSize: 22,
                              // ),
                              Text('mintemp : ${weatherData!.minTemp.toInt()}'),
                              //   style: TextStyle(
                              //     fontSize: 22,
                              // ),
                              // Text('min:15',style: TextStyle(
                              //     fontSize: 22,
                              //     ),
                              // ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        weatherData!.weatherStateName,
                        style: const TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
