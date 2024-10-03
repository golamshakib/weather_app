
## Project Overview
This project is a weather application built using Flutter that displays real-time weather data for the user’s current location and other places via a search functionality. The app leverages the **OpenWeather API** to fetch weather data, including current weather and a 5-day/3-hour forecast. Additionally, it supports temperature unit switching between Celsius and Fahrenheit, allows location-based weather detection using the device's GPS, and includes a bottom navigation bar for easy navigation between screens.

## Features
- **Current Weather Data**: Displays weather conditions like temperature, humidity, and weather description for the user's current location.
- **5-Day Forecast**: Shows a forecast of weather conditions in 3-hour intervals for the next 5 days.
- **Search by Location**: Allows the user to search for weather data in any city by detecting the city’s latitude and longitude.
- **Temperature Unit Conversion**: Supports switching between Celsius and Fahrenheit.
- **Location Services**: Automatically fetches and updates the weather for the user's current location.
- **Offline Mode**: The app will use the `connectivity_plus` package to detect network status and inform the user when offline.
- **Intuitive UI**: Includes a navigation bar for switching between screens and a beautiful weather UI with real-time updates.

## Getting Started

### Prerequisites
- **Flutter SDK**: Ensure you have Flutter installed. [Get Flutter](https://flutter.dev/docs/get-started/install)
- **API Key**: Obtain an API key from [OpenWeather](https://openweathermap.org/api) to use for fetching weather data.

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/golamshakib/weather-app.git
    ```

2. Navigate to the project directory:
    ```bash
    cd weather-app
    ```

3. Install dependencies:
    ```bash
    flutter pub get
    ```

4. Set up your API key:
    - Create a `.env` file in the root directory of your project and add your OpenWeather API key as follows:
      ```bash
      APIKEY=your_openweather_api_key
      ```

5. Run the app:
    ```bash
    flutter run
    ```

### Key Files

- **`main.dart`**: Entry point of the application. It initializes the `WeatherProvider` and sets the app's orientation to portrait mode.
- **`layout_screen.dart`**: Contains the layout and navigation logic for switching between different screens like Home, Location-based weather, and Search.
- **`home_screen.dart`**: Displays weather data for the current location.
- **`search_bar_screen.dart`**: Allows users to search for weather information by entering a location's name.
- **`weather_provider.dart`**: Contains the business logic for fetching current and forecast weather data from the OpenWeather API, managing temperature unit preferences, and retrieving the device's current location.
- **`weather_section.dart`**: Custom widget that displays current weather details such as temperature, weather condition, and forecast.
- **`connectivity_plus`**: This package will be added to handle network connectivity checks, displaying an appropriate message when the user is offline.

### Bottom Navigation Bar
The app's bottom navigation bar allows users to switch between:
1. **Home**: Displays the current weather data for the user's location.
2. **Home Weather**: Fetches and displays weather information based on the device’s Default Home Weather Info.
3. **Search**: Allows users to search for weather data in any city.

### Weather API
The application fetches weather data from the OpenWeather API using two endpoints:
1. **Current Weather**: To fetch real-time weather data based on location (latitude & longitude).
2. **Forecast Weather**: To retrieve a 5-day forecast with data in 3-hour intervals.

### Search Feature (Planned)
The search screen will allow users to input a city's name, which will be converted into latitude and longitude coordinates. The corresponding weather data will be fetched using the OpenWeather API.

### Network Connectivity (Planned)
Using `connectivity_plus`, the app will:
- Detect when the device is online or offline.
- Display a message or alert when no internet connection is available.

## Future Enhancements
- **Search by Location**: The search functionality will be improved to allow users to search for weather data of any place.
- **Offline Mode**: Use cached weather data when the device is offline.

## Dependencies
- `provider`: State management package to manage the app's weather data state.
- `flutter_dotenv`: Used to tore my API Key.
- `geolocator`: Used to fetch the device’s location.
- `shared_preferences`: For storing user preferences such as temperature unit.
- `http`: To handle API requests.
- `connectivity_plus`: To check network connectivity (planned integration).

## API Usage
You will need an OpenWeather API key to fetch weather data. Place this API key in the `.env` file located at the root of your project.

```bash
APIKEY=your_openweather_api_key
```

## Known Issues and Fixes
1. **Infinite Widget Rebuilds**:
    - Problem: Excessive or unnecessary widget rebuilds can occur when state changes.
    - Fix: Optimize the use of `Consumer` widgets and move static content outside of widget trees that are rebuilt often.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

---

This README gives an overview of the Weather App project and highlights its key features, the structure of the code, and future enhancements. With improvements like search functionality and network connectivity checks, the app is designed to provide real-time, accurate weather information with an intuitive user experience.
