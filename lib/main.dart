import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/core/presentation/themes/theme_provider.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Predictiva Take Home Assesment',
      debugShowCheckedModeBanner: false, //add flavours to change this
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const DashboardPage(),
    );
  }
}
