import 'package:flutter/material.dart';

class DashboardWide extends StatelessWidget {
  final double width;
  final double height;
  const DashboardWide({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              'Hi Robin,',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: width * 0.07,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              'Here is an overview of your account activities.',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: width * 0.04),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
