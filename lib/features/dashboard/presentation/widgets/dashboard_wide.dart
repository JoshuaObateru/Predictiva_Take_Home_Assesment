import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/core/presentation/widgets/custom_text_widget.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/domain/entities/portfolio_entity.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/domain/entities/trade_entity.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/info_border_widget.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/wide_trades_table_widget.dart';

class DashboardWide extends StatelessWidget {
  final double width;
  final double height;
  final List<TradeEntity> orders;
  final PortfolioEntity? portfolio;
  const DashboardWide({super.key, required this.width, required this.height, required this.orders, this.portfolio});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
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
                fontSize: width * 0.025,
              ),
              textAlign: TextAlign.start,
            ),
            CustomTextWidget(
                text: "Here is an overview of your account activities.",
                color: Theme.of(context).colorScheme.secondary,
                fontsize: width * 0.015),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Column(
                children: [
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius:
                            const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(text: "Balance", fontsize: width * 0.015),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                CustomTextWidget(
                                    text: "\$${portfolio?.balance}",
                                    fontsize: width * 0.02,
                                    color: Theme.of(context).colorScheme.primary),
                              ],
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: height * 0.08,
                            child: VerticalDivider(
                              thickness: 1,
                              color: Theme.of(context).colorScheme.secondaryContainer,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(text: "Profits", fontsize: width * 0.015),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: [
                                    CustomTextWidget(
                                        text: "${portfolio?.profit}",
                                        fontsize: width * 0.02,
                                        color: Theme.of(context).colorScheme.primary),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: InfoBorderWidget(
                                        label: "${portfolio?.profitPercentage}%",
                                        isTrending: true,
                                        increase: portfolio?.profit != null
                                            ? portfolio!.profit > 1
                                                ? true
                                                : false
                                            : false,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: height * 0.08,
                            child: VerticalDivider(
                              thickness: 1,
                              color: Theme.of(context).colorScheme.secondaryContainer,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(text: "Assets", fontsize: width * 0.015),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                CustomTextWidget(
                                    text: "${portfolio?.assets}",
                                    fontsize: width * 0.02,
                                    color: Theme.of(context).colorScheme.primary),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(context).indicatorColor,
                        ),
                        const SizedBox(width: 16),
                        CustomTextWidget(text: "This subscription expires in a month", fontsize: width * 0.015),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            WideTradesTableWidget(
              orders: orders,
            )
          ],
        ),
      ),
    );
  }
}
