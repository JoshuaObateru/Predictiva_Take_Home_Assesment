import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/core/presentation/widgets/custom_appbar.dart';
import 'package:predictiva_take_home_assesment/core/presentation/widgets/custom_text_widget.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/provider/trade_provider.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/dashboard_mobile.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/dashboard_wide.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> tradeScaffoldKey = GlobalKey();
  @override
  void initState() {
    super.initState();

    Provider.of<TradeProvider>(context, listen: false).call();
  }

  @override
  Widget build(BuildContext context) {
    // final tradeUseCase = Provider.of<TradeProvider>(context, listen: false);
    // final portfolioCase = Provider.of<PortfolioProvider>(context);
    // tradeUseCase.fetchOpenTrades();
    return Consumer<TradeProvider>(
      builder: (_, tradeProvider, child) {
        if (tradeProvider.isLoading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // if (tradeProvider.errorMessage.isNotEmpty) {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       // Return the content of the popup dialog
        //       return AlertDialog(
        //         content: CustomTextWidget(
        //           text: tradeProvider.errorMessage,
        //           color: Theme.of(context).colorScheme.error,
        //         ),
        //       );
        //     },
        //   );
        // }

        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: CustomAppBar(
              child: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            body: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return DashboardMobile(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  orders: tradeProvider.openTrades,
                  portfolio: tradeProvider.portfolio,
                );
              } else {
                return DashboardWide(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  orders: tradeProvider.openTrades,
                  portfolio: tradeProvider.portfolio,
                );
              }
            }));
      },
    );
  }
}
