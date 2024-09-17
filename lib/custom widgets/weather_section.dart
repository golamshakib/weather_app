import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/forecast_weather_model.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/helper_functions.dart';

class WeatherSection extends StatelessWidget {
  const WeatherSection({
    super.key,
    required this.currentWeatherModel,
    required this.forecastWeatherModel,
    required this.symbol,
  });

  final CurrentWeatherModel currentWeatherModel;
  final ForecastWeatherModel forecastWeatherModel;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background6.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(
                height: 80.0,
              ),
              _CurrentLocationData(currentWeatherModel: currentWeatherModel),
              const SizedBox(height: 40.0),
              _CurrentWeatherData(
                  currentWeatherModel: currentWeatherModel, symbol: symbol),
            ],
          ),
        )
      ],
    );
  }
}

class _CurrentLocationData extends StatelessWidget {
  const _CurrentLocationData({
    super.key,
    required this.currentWeatherModel,
  });

  final CurrentWeatherModel currentWeatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(18.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${currentWeatherModel.name}, ${currentWeatherModel.sys!.country}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  getFormatedDateTime(currentWeatherModel.dt!, pattern: 'EEEE'),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  getFormatedDateTime(currentWeatherModel.dt!,
                      pattern: 'hh:mm a'),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  getFormatedDateTime(currentWeatherModel.dt!,
                      pattern: 'MMMd, yyyy'),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrentWeatherData extends StatelessWidget {
  const _CurrentWeatherData({
    super.key,
    required this.currentWeatherModel,
    required this.symbol,
  });

  final CurrentWeatherModel currentWeatherModel;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                capitalizeWords('${currentWeatherModel.weather!.first.description}'),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 5.0),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(iconFullUrl(currentWeatherModel.weather!.first.icon!)),
                      Text(
                        '${currentWeatherModel.main!.temp!.round()}$degree$symbol',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'Low',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.grey.shade400,
                    height: 200.0,
                    width: 1.0,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.network(iconFullUrl(currentWeatherModel.weather!.first.icon!)),
                      Text(
                        '${currentWeatherModel.main!.temp!.round()}$degree$symbol',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'High',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
