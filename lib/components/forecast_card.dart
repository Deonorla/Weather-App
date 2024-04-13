import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: const Column(
          children: [
            Text("9:00",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.cloud,
              size: 32,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "271.90",
            ),
          ],
        ),
      ),
    );
  }
}
