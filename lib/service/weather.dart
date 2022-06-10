import 'package:climate/service/location.dart';
import 'package:climate/service/networking.dart';

const apikey = 'f445c6f7db6d40db22c9726b715779f0';
const openweathermap = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityweather(city) async {
    WeatherData weather =
        WeatherData('$openweathermap?q=$city&appid=$apikey&units=metric');
    var decodedData = await weather.getdata();
    return decodedData;
  }

  Future<dynamic> getlocationweather() async {
    Location location = Location();
    await location.getcurrentlocation();

    WeatherData weather = WeatherData(
        '$openweathermap?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var decodedData = await weather.getdata();
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
