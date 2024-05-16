import 'package:flutter/material.dart';
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
            DataTable(
                headingRowHeight: 4,
                // columnSpacing: double.maxFinite,
                dataRowHeight: height * 0.08,
                columns: const [
                  //   DataColumn(label: Text('ID')),
                  // DataColumn(label: Text('Name')),
                  DataColumn(
                    label: SizedBox.shrink(),
                  ),
                  DataColumn(
                    label: SizedBox.shrink(),
                  ),
                ],
                rows: paginatedData
                    .map((trade) => DataRow(cells: [
                          DataCell(Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextWidget(
                                  text: trade['Symbol']!,
                                  fontsize: width * 0.04,
                                  color: Theme.of(context).colorScheme.primary),
                              FittedBox(
                                fit: BoxFit.contain,
                                child: InfoBorderWidget(
                                  label: trade['Action']!,
                                ),
                              )
                            ],
                          )),
                          DataCell(Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextWidget(
                                  text: trade['Price']!,
                                  fontsize: width * 0.04,
                                  color: Theme.of(context).colorScheme.secondary),
                              CustomTextWidget(text: trade['Date']!, color: Theme.of(context).textTheme.caption?.color),
                            ],
                          )),
                        ]))
                    .toList()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
                  disabledColor: Colors.grey, // Disable button visual cue (optional)
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed:
                      _currentPage < (data.length / _pageSize).ceil() ? () => setState(() => _currentPage++) : null,
                  disabledColor: Colors.grey, // Disable button visual cue (optional)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
