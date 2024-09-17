import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isOn = false;

  @override
  void didChangeDependencies() {
    context.read<WeatherProvider>().getTempStatus()
        .then((value){
          setState(() {
            isOn = value;
          });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          SwitchListTile(value: isOn, onChanged: (value){
            setState(() {
              isOn = value;
            });
            context.read<WeatherProvider>().updateUnit(value);
            context.read<WeatherProvider>().setTempStatus(value);
            context.read<WeatherProvider>().weatherData();
          },
            title: const Text('Show temperature in Fahrenheit'),
            subtitle: const Text('Default is Celsius'),
          )
        ],
      ),
    );
  }
}
