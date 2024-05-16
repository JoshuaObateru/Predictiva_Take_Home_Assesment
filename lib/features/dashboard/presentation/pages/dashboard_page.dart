import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/core/presentation/widgets/custom_appbar.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/dashboard_mobile.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/dashboard_wide.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: CustomAppBar(
          child: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return DashboardMobile(width: constraints.maxWidth, height: constraints.maxHeight);
          } else {
            return DashboardWide(width: constraints.maxWidth, height: constraints.maxHeight);
          }
        }));
  }
}
