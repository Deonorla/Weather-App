import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final String value;

  const AdditionalInfoItem(
      {super.key, required this.text, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
