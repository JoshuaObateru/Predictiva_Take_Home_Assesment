import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/core/presentation/widgets/custom_text_widget.dart';

class InfoBorderWidget extends StatelessWidget {
  final bool? isTrending;
  final bool? increase;
  final String label;
  const InfoBorderWidget({super.key, this.isTrending = false, this.increase, required this.label});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(
              color: isTrending == true && increase == true
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(width)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
        child: Row(
          children: [
            isTrending == true
                ? Icon(
                    increase == true ? Icons.trending_up : Icons.transit_enterexit_outlined,
                    color:
                        increase == true ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.error,
                  )
                : const SizedBox.shrink(),
            CustomTextWidget(
              text: label,
              color: isTrending == true && increase == true
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.error,
            )
          ],
        ),
      ),
    );
  }
}
