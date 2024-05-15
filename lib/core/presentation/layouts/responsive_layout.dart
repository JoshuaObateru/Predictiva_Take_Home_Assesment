import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final Widget mobileBody;
  final Widget wideBody;
  const MyWidget({super.key, required this.mobileBody, required this.wideBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobileBody;
      } else {
        return wideBody;
      }
    });
  }
}
