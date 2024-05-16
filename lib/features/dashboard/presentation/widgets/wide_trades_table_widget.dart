import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/icon_button_border.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/info_border_widget.dart';

import '../../../../core/presentation/widgets/custom_text_widget.dart';

class WideTradesTableWidget extends StatefulWidget {
  const WideTradesTableWidget({super.key});

  @override
  State<WideTradesTableWidget> createState() => _WideTradesTableWidgetState();
}

class _WideTradesTableWidgetState extends State<WideTradesTableWidget> {
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
                    text: "Open Trades", fontsize: width * 0.02, color: Theme.of(context).colorScheme.primary),
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
            SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Expanded(child: CustomTextWidget(text: "Symbol")),
                          Expanded(child: CustomTextWidget(text: "Price")),
                          Expanded(child: CustomTextWidget(text: "Type")),
                          Expanded(child: CustomTextWidget(text: "Action")),
                          Expanded(child: CustomTextWidget(text: "Quantity")),
                          Expanded(child: CustomTextWidget(text: "Date")),
                        ],
                      ),
                    ),
                    Column(
                      children: paginatedData
                          .map((trade) => Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer),
                                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      // mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: CustomTextWidget(
                                              text: trade['Symbol']!, color: Theme.of(context).colorScheme.primary),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                              text: trade['Price']!, color: Theme.of(context).colorScheme.secondary),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                              text: trade['Type']!, color: Theme.of(context).colorScheme.secondary),
                                        ),
                                        Expanded(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            alignment: Alignment.centerLeft,
                                            child: InfoBorderWidget(
                                              label: trade['Action']!,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                              text: trade['Quantity']!, color: Theme.of(context).colorScheme.secondary),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                              text: trade['Date']!, color: Theme.of(context).colorScheme.secondary),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   width: width,
            //   child: DataTable(

            //       // columnSpacing: double.maxFinite,
            //       // dataRowHeight: height * 0.08,
            //       columns: const [
            //         DataColumn(label: CustomTextWidget(text: "Symbol")),
            //         DataColumn(label: CustomTextWidget(text: "Price")),
            //         DataColumn(label: CustomTextWidget(text: "Type")),
            //         DataColumn(label: CustomTextWidget(text: "Action")),
            //         DataColumn(label: CustomTextWidget(text: "Quantity")),
            //         DataColumn(label: CustomTextWidget(text: "Date")),
            //       ],
            //       rows: paginatedData
            //           .map((trade) => DataRow(cells: [
            //                 DataCell(
            //                   CustomTextWidget(text: trade['Symbol']!, color: Theme.of(context).colorScheme.primary),
            //                 ),
            //                 DataCell(
            //                   CustomTextWidget(text: trade['Price']!, color: Theme.of(context).colorScheme.secondary),
            //                 ),
            //                 DataCell(
            //                   CustomTextWidget(text: trade['Type']!, color: Theme.of(context).colorScheme.secondary),
            //                 ),
            //                 DataCell(FittedBox(
            //                   fit: BoxFit.contain,
            //                   child: InfoBorderWidget(
            //                     label: trade['Action']!,
            //                   ),
            //                 )),
            //                 DataCell(CustomTextWidget(
            //                     text: trade['Quantity']!, color: Theme.of(context).colorScheme.secondary)),
            //                 DataCell(
            //                     CustomTextWidget(text: trade['Date']!, color: Theme.of(context).colorScheme.secondary)),
            //               ]))
            //           .toList()),
            // ),
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
