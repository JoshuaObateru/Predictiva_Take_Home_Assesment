import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/icon_button_border.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/info_border_widget.dart';

import '../../../../core/presentation/widgets/custom_text_widget.dart';

class TradesTableWidget extends StatefulWidget {
  const TradesTableWidget({super.key});

  @override
  State<TradesTableWidget> createState() => _TradesTableWidgetState();
}

class _TradesTableWidgetState extends State<TradesTableWidget> {
  var data = [
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
    {"Symbol": "MINAUSDT", "Price": "1.5636", "Type": "LMT", "Action": "Sell", "Quantity": "0", "Date": "19 Dec, 2023"},
  ];
  int _currentPage = 1;
  static const int _pageSize = 5;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final paginatedData = data.sublist((_currentPage - 1) * _pageSize,
        _currentPage * _pageSize > data.length ? data.length : _currentPage * _pageSize);
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextWidget(
                    text: "Open Trades", fontsize: width * 0.05, color: Theme.of(context).colorScheme.primary),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer),
                          borderRadius: const BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.filter_list,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ))
              ],
            ),
            Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            Column(
              children: paginatedData
                  .map((trade) => Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextWidget(
                                      text: trade['Symbol']!,
                                      fontsize: width * 0.04,
                                      color: Theme.of(context).colorScheme.primary),
                                  SizedBox(
                                    height: height * 0.008,
                                  ),
                                  InfoBorderWidget(
                                    label: trade['Action']!,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextWidget(
                                      text: trade['Price']!,
                                      fontsize: width * 0.04,
                                      color: Theme.of(context).colorScheme.secondary),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  CustomTextWidget(
                                      text: trade['Date']!, color: Theme.of(context).textTheme.caption?.color),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Theme.of(context).colorScheme.secondaryContainer,
                          )
                        ],
                      ))
                  .toList(),
            ),
            Row(
              children: [
                CustomTextWidget(
                    text:
                        "${(_currentPage - 1) * _pageSize + 1} - ${_currentPage * _pageSize > data.length ? data.length : _currentPage * _pageSize} of ${data.length}"),
                const Spacer(),
                IconButtonBorder(
                  icon: Icons.arrow_back_ios,
                  onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
                ),
                IconButtonBorder(
                  icon: Icons.arrow_forward_ios,
                  onPressed:
                      _currentPage < (data.length / _pageSize).ceil() ? () => setState(() => _currentPage++) : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
