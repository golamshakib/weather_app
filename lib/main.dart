import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/first_layout_screen.dart';
import 'package:weather_app/screens/home_weather_screen.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_bar_screen.dart';
import 'package:weather_app/screens/settings_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const FirstLayoutScreen(),
      routes: {
        '/settingsScreen': (context) => const SettingsScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        '/homeWeatherScreen': (context) => const HomeWeatherScreen(),
        '/searchBarScreen': (context) => const SearchBarScreen(),
      },
    );
  }
}
