import 'dart:convert';
import 'package:http/http.dart';

class WeatherData {
  WeatherData(this.url);
  final String url;

  Future getdata() async {
    Response responce = await get(Uri.parse(url));
    if (responce.statusCode == 200) {
      String data = responce.body;
      return jsonDecode(data);
    } else {
      print(responce.statusCode);
    }
  }
}
