import 'package:flutter/material.dart';

class IconButtonBorder extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final double? size;
  const IconButtonBorder({super.key, required this.onPressed, required this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return IconButton(
      icon: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              icon,
              size: size ?? width * 0.04,
            ),
          )),
      onPressed: onPressed,
      disabledColor: Colors.grey, // Disable button visual cue (optional)
    );
  }
}
