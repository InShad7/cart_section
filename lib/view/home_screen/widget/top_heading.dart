import 'package:flutter/material.dart';

class TopHeading extends StatelessWidget {
  const TopHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 14.0, top: 12, bottom: 10),
      child: Text(
        'New Arrivals',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
