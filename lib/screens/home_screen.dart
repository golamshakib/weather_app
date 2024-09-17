import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../custom widgets/weather_section.dart';
import '../providers/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<WeatherProvider>(
            builder: (context, provider, _) => provider.hasDataLoaded()
                ? WeatherSection(
                    currentWeatherModel: provider.currentWeatherModel!,
                    forecastWeatherModel: provider.forecastWeatherModel!,
                    symbol: provider.unitSymbol,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ],
    );
  }
}
