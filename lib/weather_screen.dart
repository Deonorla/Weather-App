import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/components/additional_info_item.dart';
import 'package:weather_app/components/forecast_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});
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
      body: Padding(
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
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '300 °K',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          Text(
                            "Rain",
                            style: TextStyle(fontSize: 20),
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
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ForecastCard(),
                  ForecastCard(),
                  ForecastCard(),
                  ForecastCard(),
                  ForecastCard(),
                ],
              ),
            ),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItem(
                  value: "94",
                  text: "Humidity",
                  icon: Icons.water_drop,
                ),
                AdditionalInfoItem(
                  value: "7.67",
                  text: "Wind Speed",
                  icon: Icons.air,
                ),
                AdditionalInfoItem(
                  value: "1002",
                  text: "Pressure",
                  icon: Icons.beach_access,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
