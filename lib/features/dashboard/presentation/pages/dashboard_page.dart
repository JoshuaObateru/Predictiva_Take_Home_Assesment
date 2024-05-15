import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/core/presentation/widgets/custom_appbar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width < 600 ? 16 : width / 8),
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
      ),
    );
  }
}
