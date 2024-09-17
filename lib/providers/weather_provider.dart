import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/forecast_weather_model.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:geolocator/geolocator.dart';

class WeatherProvider with ChangeNotifier {
  CurrentWeatherModel? currentWeatherModel;
  ForecastWeatherModel? forecastWeatherModel;

  final  _prefKey = 'Status';
  double latitude = 0.0;
  double longitude = 0.0;
  String unit = metric;
  String unitSymbol =celsius;

  bool hasDataLoaded () => currentWeatherModel != null && forecastWeatherModel!= null;

  Future<void> updateUnit (bool value) async {
    unit = value ? imperial : metric;
    unitSymbol = value ? fahrenheit : celsius;
  }

  Future<bool> setTempStatus(bool value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(_prefKey, value);
  }

  Future<bool> getTempStatus () async{
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_prefKey) ?? false;
  }

  Future<void> getAllData() async {
    final status = await getTempStatus();
    await updateUnit(status);
    await detectDeviceLocation();
    await weatherData();
  }

 Future<void> detectDeviceLocation () async {
    final position = await _determinePosition();
    latitude = position.latitude;
    longitude = position.longitude;
  }


  Future<void> weatherData() async {
    await _getCurrentWeatherData();
    await _getForecastWeatherData();
  }

  _getCurrentWeatherData() async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=$unit&appid=$apiKey';
    try {
      Response response = await get(Uri.parse(url));
      Map<String, dynamic> map = jsonDecode(response.body);
      if (response.statusCode == 200) {
        currentWeatherModel = CurrentWeatherModel.fromJson(map);
        notifyListeners();
      }else{
        print(map['message']);
      }
    } catch (error) {
      print(error.toString());
    }
  }

  _getForecastWeatherData() async {
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&units=$unit&appid=$apiKey';
    try{
      Response response = await get(Uri.parse(url));
      Map<String, dynamic> map = jsonDecode(response.body);
      if(response.statusCode == 200){
        forecastWeatherModel = ForecastWeatherModel.fromJson(map);
        notifyListeners();
      }else{
        print(map['message']);
      }
    }catch(error){
      print('error');
    }
  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
