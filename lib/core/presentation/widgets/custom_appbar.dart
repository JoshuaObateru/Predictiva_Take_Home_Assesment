import 'package:flutter/material.dart';

// This is to give the scaffold appbar a bottom border
// an appbar property cannot take a child other than a prefferedsized widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double preferredHeight;

  const CustomAppBar({required this.child, this.preferredHeight = 56.0});

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: SizedBox(
            height: 1.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
