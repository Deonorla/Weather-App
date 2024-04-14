import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/components/additional_info_item.dart';
import 'package:weather_app/components/forecast_card.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future<Map<String, dynamic>> getCurrentweather() async {
    try {
      const cityName = 'Lagos';
      final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=$cityName,ng&APPID=$openWeatherAPIKey"),
      );
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw "An unexpected error occured";
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
          future: getCurrentweather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            final data = snapshot.data!;
            final currentTemp = data['list'][0]["main"]['temp'];
            final currentSky = data['list'][0]['weather'][0]['main'];
            final currentPressure = data['list'][0]['main']['pressure'];
            final currentWindSpeed = data['list'][0]['wind']['speed'];
            final currentHumidity = data['list'][0]["main"]['humidity'];

            // print(data['list'][0]['weather'][0]['main']);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  '$currentTemp°K',
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(
                                  Icons.cloud,
                                  size: 64,
                                ),
                                Text(
                                  currentSky,
                                  style: const TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Weather Forecast",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       for (int i = 0; i < 9; i++)
                  //         ForecastCard(
                  //           temperature:
                  //               data['list'][i]["main"]['temp'].toString(),
                  //           time: data['list'][i]['dt'].toString(),
                  //           icon: data['list'][0]['weather'][0]['main'] ==
                  //                       "Clouds" ||
                  //                   data['list'][0]['weather'][0]['main'] ==
                  //                       "Rain"
                  //               ? Icons.cloud
                  //               : Icons.sunny,
                  //         ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                      height: 130,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data['list'].length,
                          itemBuilder: (context, index) {
                            final hourlyForecast = data['list'][index];
                            final hourlySky =
                                data['list'][0]['weather'][0]['main'];
                            return ForecastCard(
                              temperature:
                                  hourlyForecast["main"]['temp'].toString(),
                              time: hourlyForecast['dt'].toString(),
                              icon: hourlySky == "Clouds" || hourlySky == "Rain"
                                  ? Icons.cloud
                                  : Icons.sunny,
                            );
                          })),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Additional Information",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfoItem(
                        value: currentPressure.toString(),
                        text: "Humidity",
                        icon: Icons.water_drop,
                      ),
                      AdditionalInfoItem(
                        value: currentWindSpeed.toString(),
                        text: "Wind Speed",
                        icon: Icons.air,
                      ),
                      AdditionalInfoItem(
                        value: currentHumidity.toString(),
                        text: "Pressure",
                        icon: Icons.beach_access,
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
