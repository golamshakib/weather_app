import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class ErrorHandle extends StatelessWidget {
  const ErrorHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
           String? errorMessage = await context.read<WeatherProvider>().getAllData();
           if(errorMessage != null && context.mounted){
             _showAlertDialog(context, errorMessage);
           }
          },
          child: const Text('Get Weather Data'),
        ),
      ),
    );
  }
}

void _showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

