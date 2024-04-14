
# Lagos Weather App

A simple Flutter single-page weather app that fetches weather forecasts for Lagos, Nigeria, using the OpenWeatherAPI.

## Features

- View current weather conditions in Lagos.
- Get a 5-day weather forecast for Lagos.

## Screenshot
<img width="1440" alt="Screenshot 2024-04-14 at 16 14 44" src="https://github.com/Deonorla/Weather-App/assets/91434033/c2fbd8f1-8a77-4b00-8190-ed320c8f2d65">


## Getting Started

To get started with this app, follow these steps:

1. Clone this repository:

```bash
git clone https://github.com/Deonorla/Weather-App.git
```

2. Navigate to the project directory:

```bash
cd weather_app
```

3. Install dependencies:

```bash
flutter pub get
```

4. Get your API key from [OpenWeatherAPI](https://openweathermap.org/api) by signing up for an account if you haven't already.

5. Create a file named `secrets.dart` in the `lib` directory.

6. Add your API key to `secrets.dart`:

```dart
const String openWeatherAPIKey = 'YOUR_API_KEY';
```

7. Run the app:

```bash
flutter run
```

## How to Use

Simply launch the app, and it will automatically fetch the current weather conditions and the 5-day forecast for Lagos, Nigeria.

## Dependencies

This app uses the http dependency:

- [http](https://pub.dev/packages/http) - For making HTTP requests to the OpenWeatherAPI.

