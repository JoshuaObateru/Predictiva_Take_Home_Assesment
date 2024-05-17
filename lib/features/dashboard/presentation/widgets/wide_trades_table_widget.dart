import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/domain/entities/trade_entity.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/filter_widget.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/icon_button_border.dart';
import 'package:predictiva_take_home_assesment/features/dashboard/presentation/widgets/info_border_widget.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/widgets/custom_text_widget.dart';

class WideTradesTableWidget extends StatefulWidget {
  final List<TradeEntity> orders;
  const WideTradesTableWidget({super.key, required this.orders});

  @override
  State<WideTradesTableWidget> createState() => _WideTradesTableWidgetState();
}

class _WideTradesTableWidgetState extends State<WideTradesTableWidget> {
  final formatter = NumberFormat('#,###.####');
  int _currentPage = 1;
  static const int _pageSize = 5;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final List<TradeEntity> paginatedData = widget.orders.sublist((_currentPage - 1) * _pageSize,
        _currentPage * _pageSize > widget.orders.length ? widget.orders.length : _currentPage * _pageSize);
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
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // Return the content of the popup dialog
                          return AlertDialog(
                            content: FilterWidget(
                              onApply: (text, value, startDate, endDate) {
                                // Handle filter application logic here
                                print('Text: $text, Value: $value, Start Date: $startDate, End Date: $endDate');
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer),
                          borderRadius: const BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            CustomTextWidget(
                              text: "Filter",
                              fontsize: width * 0.01,
                            ),
                            Icon(
                              Icons.filter_list,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: height * 0.02,
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
                                              text: trade.symbol, color: Theme.of(context).colorScheme.primary),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                              text: formatter.format(trade.price),
                                              color: Theme.of(context).colorScheme.secondary),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                              text: trade.type, color: Theme.of(context).colorScheme.secondary),
                                        ),
                                        Expanded(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            alignment: Alignment.centerLeft,
                                            child: InfoBorderWidget(
                                              label: trade.side,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                              text: formatter.format(trade.quantity),
                                              color: Theme.of(context).colorScheme.secondary),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                              text: DateFormat('d MMM, y')
                                                  .format(DateTime.fromMicrosecondsSinceEpoch(trade.creationTime)),
                                              color: Theme.of(context).colorScheme.secondary),
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
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                CustomTextWidget(
                    text:
                        "${(_currentPage - 1) * _pageSize + 1} - ${_currentPage * _pageSize > widget.orders.length ? widget.orders.length : _currentPage * _pageSize} of ${widget.orders.length}"),
                const Spacer(),
                IconButtonBorder(
                  icon: Icons.arrow_back_ios,
                  onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
                ),
                IconButtonBorder(
                  icon: Icons.arrow_forward_ios,
                  onPressed: _currentPage < (widget.orders.length / _pageSize).ceil()
                      ? () => setState(() => _currentPage++)
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
