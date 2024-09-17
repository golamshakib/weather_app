import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_bar_screen.dart';
import 'home_location_screen.dart';

class FirstLayoutScreen extends StatefulWidget {
  const FirstLayoutScreen({super.key});

  @override
  State<FirstLayoutScreen> createState() => _FirstLayoutScreenState();
}

class _FirstLayoutScreenState extends State<FirstLayoutScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeLocationScreen(),
    const SearchBarScreen(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<WeatherProvider>().getAllData();
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Weather',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/settingsScreen');
                    },
                    icon: const Icon(Icons.more_vert_sharp)),
              ),
            ),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
            backgroundColor: Colors.transparent,
            elevation: 0,
            indicatorColor: Colors.black54,
            labelTextStyle: WidgetStatePropertyAll(TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ))),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _navigateBottomBar,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.location_on_outlined),
              selectedIcon: Icon(Icons.location_on),
              label: 'Home Location',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
