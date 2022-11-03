import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weatherModel.dart';
class WeatherData {
  Future<Weather?>getData(var latitude,var longitude) async{
    var uricall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=6329b70ea8ec42ff86a113045222210&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uricall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
