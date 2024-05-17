import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/core/presentation/themes/theme_provider.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/data/repositories/trade_repository_impl.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/pages/dashboard_page.dart';

import 'package:predictiva_take_home_assesment/features/dashboard/presentation/provider/trade_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => TradeProvider(TradeRepositoryImpl())),
    ],
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
