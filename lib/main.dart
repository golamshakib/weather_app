import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/first_layout_screen.dart';
import 'package:weather_app/screens/home_location_screen.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_bar_screen.dart';
import 'package:weather_app/screens/settings_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
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
        '/homeLocationScreen': (context) => const HomeLocationScreen(),
        '/searchBarScreen': (context) => const SearchBarScreen(),
      },
    );
  }
}
