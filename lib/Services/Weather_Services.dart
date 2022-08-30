import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/Model/Weather_Model.dart';

class WeatherService {
  String baseUrl = 'http://www.metaweather.com ';
  Future<int> getCityId({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');
    http.Response response = await http.get(url);
    print(response.body);

    List<dynamic> data = jsonDecode(response.body);
    int cityId = data[0]['woeid'];
    return cityId;
  }

  Future<WeatherModel> getWeather({required String cityName}) async {
    int id = await getCityId(cityName: cityName);
    var baseUrl;
    Uri url = Uri.parse('$baseUrl/api/location/$id/');
    http.Response response = await http.get(url);

    Map<String , dynamic> jsonData = jsonDecode(response.body);
    Map<String , dynamic> data = jsonData['consolidated_weather'][0];

 WeatherModel weatherData= WeatherModel.fromjson(data);

     return weatherData;
  }
}

// class WeatherService{
//
//   String baseUrl='http://api.weatherapi.com/v1';
//   String apiKey='3677bed892474b7a122242220806';
//
//   void getWeather ({
//   required String cityName}) async{
//     Uri url =Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
//     http.Response response= await http.get(url);
//     Map<String , dynamic> data = jsonDecode(response.body);
//     WeatherModel weather = WeatherModel (date: data['location']['localtime'],
//       minTemp: data ['mintemp_c'],
//       maxTemp: data ['maxtemp_c'],
//       temp: data['avgtemp_c'],
//       weatherStateName: data['condition']['text'],
//     );
//
//
//
//   }
//
// }