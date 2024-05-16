import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/core/presentation/widgets/custom_text_widget.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/domain/entities/trade_entity.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/info_border_widget.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/trades_table_widget.dart';

class DashboardMobile extends StatelessWidget {
  final double width;
  final double height;
  final List<TradeEntity> orders;
  const DashboardMobile({super.key, required this.width, required this.height, required this.orders});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            CustomTextWidget(text: "Hi Robin,", fontsize: width * 0.06, color: Theme.of(context).colorScheme.primary),
            const CustomTextWidget(
              text: "Here is an overview of your account activities.",
            ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomTextWidget(
                            text: "Balance",
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CustomTextWidget(
                              text: "\$616.81", fontsize: width * 0.05, color: Theme.of(context).colorScheme.primary),
                          Divider(
                            thickness: 1,
                            color: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          const CustomTextWidget(
                            text: "Profits",
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              CustomTextWidget(
                                  text: "\$86.03",
                                  fontsize: width * 0.05,
                                  color: Theme.of(context).colorScheme.primary),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: InfoBorderWidget(
                                  label: "8%",
                                  isTrending: true,
                                  increase: false,
                                ),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          const CustomTextWidget(
                            text: "Assets",
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CustomTextWidget(
                              text: "12", fontsize: width * 0.05, color: Theme.of(context).colorScheme.primary),
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
                        const CustomTextWidget(
                          text: "This subscription expires in a month",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            TradesTableWidget(
              orders: orders,
            )
          ],
        ),
      ),
    );
  }
}
